class CreateFranjaGlobals < ActiveRecord::Migration[5.1]
  def change
    create_table :franja_globals do |t|
      t.string :horaInicio
      t.string :horaFinal
      t.float :tiempoServicioPromedio
      t.float :tiempoLlegadaPromedio
      t.integer :existenciaCiclasPromedio
      t.integer :idStation

      t.timestamps
    end
  end
end
