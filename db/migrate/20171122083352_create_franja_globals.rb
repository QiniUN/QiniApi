class CreateFranjaGlobals < ActiveRecord::Migration[5.1]
  def change
    create_table :franja_globals do |t|
      t.time :horaInicio
      t.time :horaFinal
      t.float :tiempoServicioPromedio
      t.float :tiempoColaPromedio
      t.integer :existenciaCiclasPromedio
      t.integer :idStation

      t.timestamps
    end
  end
end
