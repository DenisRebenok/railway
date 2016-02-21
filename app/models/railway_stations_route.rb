class RailwayStationsRoute < ActiveRecord::Base
  belongs_to :railway_station
  belongs_to :route

  default_scope { order(:position) }

  # validates :railway_station_id, presence: true, uniqueness: { scope: :route_id }
  validates :position, numericality: true

  scope :ordered, -> { order(:position) }
end