class RailwayStation < ActiveRecord::Base
  has_many :trains
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes # Станция может принадлежать множеству маршрутов

  validates :title, presence: true, uniqueness: true

  scope :ordered, -> { joins(:railway_stations_routes).order("railway_stations_routes.position").uniq }

  def update_position(route, position)
    station_route = station_route(route)
    station_route.update(position: position) if station_route
  end

  def position_in(route)
    station_route(route).try(:position)
  end

  def update_time(route, arrival_time, departure_time)
    station_route = station_route(route)
    if station_route
      station_route.update(arrival_time: arrival_time, departure_time: departure_time)
    end
  end

  def arrive_in(route)
    station_route(route).try(:arrival_time)
  end

  def departure_in(route)
    station_route(route).try(:departure_time)
  end

  def arrive_time(train)
    station_route(train.route).try(:arrival_time)
  end

  def departure_time(train)
    station_route(train.route).try(:departure_time)
  end

  private

  def station_route(route)
    @station_route ||= railway_stations_routes.find_by(route: route)
  end
end
