class Train < ActiveRecord::Base
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :tickets
  has_many :wagons
  # has_many :users, through: :tickets

  validates :number, presence: true#, format: {with: /^[а-яa-z\d]{3}-?[а-яa-z\d]{2}$/i, uniqueness: true}

  def places_count(wagon_type, place_type)
    wagons.where(wagon_type: wagon_type).sum("#{place_type}_places")
  end

  # def arrive_time(station)
  #   RailwayStationsRoute.where(railway_station_id: station.id).first.arrival_time
  # end
  #
  # def departure_time(station)
  #   RailwayStationsRoute.where(railway_station_id: station.id).first.departure_time
  # end
end
