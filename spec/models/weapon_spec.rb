require 'rails_helper'

RSpec.describe Weapon, type: :model do
  it "CRUD: Weapon creation should fail (missing stats)" do
    Weapon.create(name: "fists", attack: 0)
    Weapon.create(name: "sword", attack: 10)
    Weapon.create(name: "shield", defense: 10)
    expect(Weapon.count).to eq(0)
  end

  it "CRUD: Weapon creation working (all stats)" do
    Weapon.create(name: "fists", attack: 0, defense: 0)
    Weapon.create(name: "sword", attack: 10, defense: 0)
    Weapon.create(name: "shield", attack: 0, defense: 10)
    expect(Weapon.count).to eq(3)
  end
end
