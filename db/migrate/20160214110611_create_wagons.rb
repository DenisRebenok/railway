class CreateWagons < ActiveRecord::Migration
  def change
    create_table :wagons do |t|
      t.integer :number
      t.string  :type
      t.integer :upper_places
      t.integer :lower_places
      t.integer :train_id

      t.timestamps null: false
    end
  end
end
