class StationController < ApplicationController
  def getStation
    @idEstacion = Integer(params["idEstacion"])
    @horario = params["horario"]

    @data = { esperaActual: 5, esperaPromedio: 7, fila: 5, ciclas: 10 }
    render json: @data
  end

  def postStation
    @id = Integer( params[:id] )
    @tiempo = Float(params[:tiempo])
    @fila = Integer(params[:fila])
    @servidores = Integer(params[:servidores])

    render json: { id: @id, tiempo: @tiempo, fila: @fila, servidores: @servidores }
  end

  private
  def postParams
    params.require(  ).permit( :id, :tiempo, :fila, :servidores )
  end
end
