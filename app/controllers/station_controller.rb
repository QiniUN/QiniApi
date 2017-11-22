class StationController < ApplicationController
  def getStation
    @idEstacion = Integer(params["idEstacion"])
    @franja = params["horario"].split( ' - ' )

    # Lambda
    @llegadaProm = EsperaActual.where( "idStation = ? AND horaInicio = ? ", @idEstacion, @franja[0] ).average(:duracionEspera)

    @global = FranjaGlobal.where( "idStation = ? AND horaInicio = ? ", @idEstacion, @franja[0] )

    # Miu
    @servicioProm = @global[0].tiempoServicioPromedio
    @servicioProm = 1 / @servicioProm

    # C
    @servidores = Station.find(@idEstacion).servidores

    @Lq = nil
    if @llegadaProm != nil
      @r = @llegadaProm/@servicioProm
      @ro = @r/@servidores

      @sum = 0
      (0..(@servidores-1)).each do |i|
      	@f = (1..i).inject(:*) || 1
      	@sum += (@r**i)/(@f)
      end

      @fact = (1..@servidores).inject(:*) || 1
      @P0 = 1/(@sum + @r**@servidores/(@fact*(1-@ro)))

      #Lq
      @Lq = (@r**@servidores * @ro)/(@fact * (1 - @ro)**2) * @P0

      # W
      @W = (@Lq / @llegadaProm) + (1/@servicioProm)
    end

    @esperaPromedio = FranjaGlobal.where("idStation = ? AND horaInicio = ? ", @idEstacion, @franja[0])
    @esperaPromedio = @esperaPromedio[0].tiempoColaPromedio + @servicioProm

    @data = { esperaActual: @W, esperaPromedio: @esperaPromedio, fila: @Lq, ciclas: 10, llprom: @llegadaProm, sprom: @servicioProm }
    render json: @data
  end

  def postStation
    @id = Integer( params[:id] )
    @tiempo = Float(params[:tiempo])
    @fila = Integer(params[:fila])
    @servidores = Integer(params[:servidores])
    @franja = params[:franja].split(' - ')

    @station = Station.find(@id)
    @station.servidores = @servidores
    @guarda = @station.save != nil

    @global = FranjaGlobal.where( "idStation = ? AND horaInicio = ? ", @id, @franja[0] )
    @servicio = @global[0].tiempoServicioPromedio

    #@cola = @tiempo #- @servicio
    @llegada = @fila / @tiempo

    @guarda = @guarda && ( EsperaActual.create( duracionEspera: @llegada, idStation: @id, horaInicio: @franja[0] ) != nil )

    render json: { guarda: @guarda, tiempo: @tiempo, llegada: @llegada }
  end

  private
  def postParams
    params.require(  ).permit( :id, :tiempo, :fila, :servidores )
  end
end
