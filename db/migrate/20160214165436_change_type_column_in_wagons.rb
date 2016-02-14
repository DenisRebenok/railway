class ChangeTypeColumnInWagons < ActiveRecord::Migration
  def change
    change_column :wagons, :type, :integer
  end
end
