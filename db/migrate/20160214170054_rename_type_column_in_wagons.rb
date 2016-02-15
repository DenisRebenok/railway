class RenameTypeColumnInWagons < ActiveRecord::Migration
  def change
    remove_column :wagons, :type, :integer
    add_column :wagons, :wagon_type, :integer
  end
end
