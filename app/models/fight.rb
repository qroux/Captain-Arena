class Fight < ApplicationRecord
  belongs_to :player, class_name: "Fighter"
  belongs_to :opponent, class_name: "Fighter"
end
