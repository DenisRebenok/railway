class ChangeWagonScheme < ActiveRecord::Migration
  def change
    remove_column :wagons, :type, :integer
    remove_column :wagons, :side_top_places, :integer
    remove_column :wagons, :side_bottom_places, :integer
    add_column :wagons, :type, :string
    add_column :wagons, :side_upper_places, :integer
    add_column :wagons, :side_lower_places, :integer
    add_column :wagons, :sitting_places, :integer
  end
end
