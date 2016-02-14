class Ticket < ActiveRecord::Base
  belongs_to :train
  belongs_to :start_station, class_name: 'RailwayStation', foreign_key: :start_station_id
  belongs_to :end_station, class_name: 'RailwayStation', foreign_key: :end_station_id
  belongs_to :user

  validates :train, :start_station, :end_station, :user_name, presence: true
end
