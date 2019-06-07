class Fighter < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :health, presence: true, inclusion: { in: (100..200), message: "must be between 100 and 150" }
  validates :power, presence: true, inclusion: { in: (10..50), message: "must be between 10 and 50" }
end
