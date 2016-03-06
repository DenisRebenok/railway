class AddStationTimesToStationsRoutes < ActiveRecord::Migration
  def change
    add_column :railway_stations_routes, :arrival_time, :timestamp
    add_column :railway_stations_routes, :departure_time, :timestamp
  end
end
