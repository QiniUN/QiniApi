class CreateEsperaActuals < ActiveRecord::Migration[5.1]
  def change
    create_table :espera_actuals do |t|
      t.float   :tiempoServicio
      t.float   :tiempoLlegada
      t.integer :idStation
      t.string  :horaInicio
      
      t.timestamps
    end
  end
end
