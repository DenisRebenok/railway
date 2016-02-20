class Train < ActiveRecord::Base
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :tickets
  has_many :wagons
  # has_many :users, through: :tickets

  validates :number, presence: true#, format: {with: /^[а-яa-z\d]{3}-?[а-яa-z\d]{2}$/i, uniqueness: true}

  WAGON_TYPES = { econom: 0, coupe: 1 }

  def wagons_by_type(type)
    wagons.where(wagon_type: WAGON_TYPES[type])
  end

  def upper_places_count(type)
    wagons.where(wagon_type: WAGON_TYPES[type]).sum(:upper_places)
  end

  def lower_places_count(type)
    wagons.where(wagon_type: WAGON_TYPES[type]).sum(:lower_places)
  end
end
