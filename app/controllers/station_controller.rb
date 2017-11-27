class StationController < ApplicationController
  def getStation
    @idEstacion = Integer(params["idEstacion"])
    @nombreEstacion = Station.find(@idEstacion).name
    @ciclas = Station.find(@idEstacion).bicicletas
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

    @data = { nombreEstacion:  @nombreEstacion, esperaActual: @W, esperaPromedio: @esperaPromedio, fila: @Lq, ciclas: @ciclas }
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

    @llegada = Float(@fila) / ( @tiempoCola )
    @servicio = 1.0/@tiempoServicio

    if( @llegada > @servicio )
      @llegada = @servicio - ( @servicio * 0.4 )
    end

    @guarda = @guarda && ( EsperaActual.create( tiempoLlegada: @llegada, tiempoServicio: @servicio, idStation: @id, horaInicio: @franja[0] ) != nil )

    render json: { guarda: @guarda }
  end

  def postBikes
    @CALLE_45 = Integer( params[:CALLE_45] )
    @CALLE_53 = Integer( params[:CALLE_53] )
    @CYT      = Integer( params[:CYT] )
    @CALLE_26 = Integer( params[:CALLE_26] )
    @URIEL    = Integer( params[:URIEL_GUTIERREZ] )

    @station = Station.find(1)
    @station.bicicletas = @CALLE_26
    @station.save

    @station = Station.find(2)
    @station.bicicletas = @CALLE_45
    @station.save

    @station = Station.find(3)
    @station.bicicletas = @CALLE_53
    @station.save

    @station = Station.find(4)
    @station.bicicletas = @CYT
    @station.save

    @station = Station.find(5)
    @station.bicicletas = @URIEL
    @station.save
  end

  private
  def postParams
    params.require(  ).permit( :id, :tiempo, :fila, :servidores, :CALLE_45, :CALLE_53, :CYT, :CALLE_26, :URIEL_GUTIERREZ )
  end
end
