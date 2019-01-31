class Exercise < ApplicationRecord
  belongs_to :user
  validates :duration_in_min, presence: true, numericality: {only_integer: true, greater_than: 0 }
  validates :workout, presence: true

end
