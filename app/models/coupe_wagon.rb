class CoupeWagon < Wagon
  validates :lower_places, :upper_places, presence: true
end