class Train < ActiveRecord::Base
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :tickets
  has_many :wagons
  # has_many :users, through: :tickets

  validates :number, presence: true#, format: {with: /^[а-яa-z\d]{3}-?[а-яa-z\d]{2}$/i, uniqueness: true}

  def wagons_by_type(type_id)
    wagons.where(wagon_type: type_id)
  end

  def upper_places_count(type_id)
    wagons.where(wagon_type: type_id).sum(:upper_places)
  end

  def lower_places_count(type_id)
    wagons.where(wagon_type: type_id).sum(:lower_places)
  end
end
