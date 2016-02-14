class Wagon < ActiveRecord::Base
  belongs_to :train
  validates :number, presence: true
  validates :number, uniqueness: { scope: :train }, unless: "train.nil?"
  validates :type, presence: true
  validates :lower_places, :upper_places, presence: true

  before_validation :set_number

  private

  def set_number
    set_number! if train && (new_record? || changing_trains?)
  end

  def set_number!
    last_number = train.wagons.maximum(:number)
    self.number = last_number ? (last_number + 1) : 1
  end

  def changing_trains?
    Wagon.find(id).train != train
  end
end
