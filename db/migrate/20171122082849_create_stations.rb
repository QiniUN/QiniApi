class CreateStations < ActiveRecord::Migration[5.1]
  def change
    create_table :stations do |t|
      t.string :name
      t.integer :bicicletas
      t.integer :servidores

      t.timestamps
    end
  end
end
