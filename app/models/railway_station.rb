class RailwayStation < ActiveRecord::Base
  has_many :trains
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes # Станция может принадлежать множеству маршрутов

  validates :title, presence: true, uniqueness: true

  def update_position(route, position)
    # Этот методо обновляет поле позиции в join-таблице для данной станции и маршрута.
    data = railway_stations_routes.find_by(route: route)
    data.update(position: position) if data
    # Надо пересмотреть скринкаст и почитать о query interface.
    # Ищем объект join-модели, указывая станцию и маршрут, и дальше обновляем у этого объекта поле позиции.
  end


  def position_in(route)
    data = railway_stations_routes.find_by(route: route)
    data.position if data
  end
end
