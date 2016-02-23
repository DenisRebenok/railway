class RailwayStation < ActiveRecord::Base
  has_many :trains
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes # Станция может принадлежать множеству маршрутов

  validates :title, presence: true, uniqueness: true

  def update_position(route, position)
    self.station_route ||= station_route_associated_model(route)
    station_route.update(position: position) if station_route
  end


  def position_in(route)
    self.station_route ||= station_route_associated_model(route)
    station_route.position if station_route
  end

  private

  attr_accessor :station_route

  def station_route_associated_model(route)
    railway_stations_routes.find_by(route: route)
  end
end
