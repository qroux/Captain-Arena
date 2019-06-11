class Fight < ApplicationRecord
  belongs_to :player, class_name: "Fighter"
  belongs_to :opponent, class_name: "Fighter"

  belongs_to :player_weapon, class_name: "Weapon"
  belongs_to :opponent_weapon, class_name: "Weapon"
end
