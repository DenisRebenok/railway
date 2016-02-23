class Wagon < ActiveRecord::Base
  belongs_to :train
  validates :number, presence: true, uniqueness: { scope: :train }, if: :train
  validates :lower_places, :upper_places,
            :side_lower_places, :side_upper_places,
            :sitting_places, numericality: { only_integer: true, allow_nil: true }

  before_validation :set_number

  scope :ordered, -> (from_head) { order(from_head ? 'number' : 'number DESC') }

  private

  def set_number
    if train && (new_record? || changed?)
      last_number = train.wagons.maximum(:number)
      self.number = last_number ? (last_number + 1) : 1
    end
  end
end
