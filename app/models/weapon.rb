class Weapon < ApplicationRecord
  belongs_to :fight, optional: true

  validates :name, presence: true
  validates :attack, presence: true
  validates :defense, presence: true
end
