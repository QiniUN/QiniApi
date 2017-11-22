class CreateEsperaActuals < ActiveRecord::Migration[5.1]
  def change
    create_table :espera_actuals do |t|
      t.float :duracionEspera
      t.integer :idStation

      t.timestamps
    end
  end
end
