class Exercise < ApplicationRecord
  belongs_to :training
  validates :sets, :reps, :weight, presence: true, numericality: { greater_than: 0 }
  validates :name, presence: true

  def volumen_total
    sets * reps * weight
  end

end
