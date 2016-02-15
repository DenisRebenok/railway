class RailwayStation < ActiveRecord::Base
  has_many :trains
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes # Станция может принадлежать множеству маршрутов

  validates :title, presence: true, uniqueness: true
end
