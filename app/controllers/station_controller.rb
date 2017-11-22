class StationController < ApplicationController
  def getStation
    @idEstacion = Integer(params["idEstacion"])
    @nombreEstacion = Station.find(@idEstacion).name
    @franja = params["horario"].split( ' - ' )

    # Lambda
    @llegadaProm = EsperaActual.where( "idStation = ? AND horaInicio = ? ", @idEstacion, @franja[0] ).average(:tiempoLlegada)

    # Miu
    @servicioProm = EsperaActual.where( "idStation = ? AND horaInicio = ? ", @idEstacion, @franja[0] ).average(:tiempoServicio)

    # C
    @servidores = Station.find(@idEstacion).servidores

    @Lq = nil
    if @llegadaProm != nil && @servicioProm != nil
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
    @esperaPromedio = @esperaPromedio[0].tiempoLlegadaPromedio + @esperaPromedio[0].tiempoServicioPromedio

    @data = { nombreEstacion:  @nombreEstacion, esperaActual: @W, esperaPromedio: @esperaPromedio, fila: @Lq, ciclas: 10 }
    render json: @data
  end

  def postStation
    @id = Integer( params[:id] )
    @tiempoServicio = Float(params[:tiempoServicio])
    @tiempoCola = Float(params[:tiempoCola])
    @fila = Integer(params[:fila])
    @servidores = Integer(params[:servidores])
    @franja = params[:franja].split(' - ')

    @station = Station.find(@id)
    @station.servidores = @servidores
    @guarda = @station.save != nil


    #@cola = @tiempo #- @servicio
    @llegada = @fila / ( @tiempoCola + @tiempoServicio )
    @servicio = 1/@tiempoServicio

    @guarda = @guarda && ( EsperaActual.create( tiempoLlegada: @llegada, tiempoServicio: @servicio, idStation: @id, horaInicio: @franja[0] ) != nil )

    render json: { guarda: @guarda }
  end

  private
  def postParams
    params.require(  ).permit( :id, :tiempo, :fila, :servidores )
  end
end
