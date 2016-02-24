class EconomyWagon < Wagon
  validates :lower_places, :upper_places, :side_upper_places, :side_lower_places, presence: true
end