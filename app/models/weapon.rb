class Weapon < ApplicationRecord
  belongs_to :fight, optional: true
end
