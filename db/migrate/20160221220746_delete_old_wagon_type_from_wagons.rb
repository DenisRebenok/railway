class DeleteOldWagonTypeFromWagons < ActiveRecord::Migration
  def change
    remove_column :wagons, :wagon_type, :integer
  end
end
