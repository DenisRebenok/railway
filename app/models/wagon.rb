class Wagon < ActiveRecord::Base
  belongs_to :train
  validates :number, presence: true
  validates :number, uniqueness: { scope: :train }, unless: "train.nil?"
  validates :wagon_type, presence: true
  validates :lower_places, :upper_places, presence: true

  before_validation :set_number

  private

  def set_number
    if train && (new_record? || changed?)
      last_number = train.wagons.maximum(:number)
      self.number = last_number ? (last_number + 1) : 1
    end
  end
end
