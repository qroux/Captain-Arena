class Fight < ApplicationRecord
  belongs_to :player, class_name: "Fighter", optional: true
  belongs_to :opponent, class_name: "Fighter", optional: true

  belongs_to :player_weapon, class_name: "Weapon", optional: true
  belongs_to :opponent_weapon, class_name: "Weapon", optional: true
end
