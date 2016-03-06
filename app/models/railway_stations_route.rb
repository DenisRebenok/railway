class RailwayStationsRoute < ActiveRecord::Base
  belongs_to :railway_station
  belongs_to :route

  # validates :railway_station_id, presence: true, uniqueness: { scope: :route_id }
  validates :position, numericality: true, allow_nil: true
end