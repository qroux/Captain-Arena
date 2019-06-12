require 'rails_helper'

RSpec.describe Fight, type: :model do
  it "CRUD: New fight without fighters should fail" do
    Fight.create
    expect(Fight.count).to eq(0)
  end

  it "CRUD: New fight without weapons should fail" do
    Fighter.create(name: "Fighter 1", health: 100, power: 10, luck: rand(1.0..2.5))
    Fighter.create(name: "Fighter 2", health: 150, power: 20, luck: rand(1.0..2.5))
    Fight.create(player: Fighter.first, opponent: Fighter.last)
    expect(Fight.count).to eq(0)
  end

  it "CRUD: New fight with fighters and weapon should work" do
    Fighter.create(name: "Fighter 1", health: 100, power: 10, luck: rand(1.0..2.5))
    Fighter.create(name: "Fighter 2", health: 150, power: 20, luck: rand(1.0..2.5))
    Weapon.create(name: "fists", attack: 0, defense: 0)
    Weapon.create(name: "sword", attack: 10, defense: 0)
    Weapon.create(name: "shield", attack: 0, defense: 10)
    Fight.create(player: Fighter.first, opponent: Fighter.last, player_weapon: Weapon.first, opponent_weapon: Weapon.last)
    expect(Fight.count).to eq(1)
  end
end
