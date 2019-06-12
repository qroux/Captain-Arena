class Fighter < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  # has_many :fights, dependent: :destroy
  # Wrong DB Scheme, can't find Fighter as player or opponent

  # PG::UndefinedColumn: ERROR: column fights.fighter_id does not exist LINE 1:
  # SELECT "fights".* FROM "fights" WHERE "fights"."fighter_id" ... ^ :
  # SELECT "fights".* FROM "fights" WHERE "fights"."fighter_id" = $1

  validates :name, presence: true, uniqueness: true, length: { maximum: 15 }
  validates :health, presence: true, inclusion: { in: (100..150), message: "must be between 100 and 150" }
  validates :power, presence: true, inclusion: { in: (10..20), message: "must be between 10 and 20" }
  validates :luck, presence: true
end
