require 'rails_helper'

RSpec.describe Fighter, type: :model do
  it "validations: Fighter creation should fail (stats missing)" do
    Fighter.create(name: "Fighter Test")
    expect(Fighter.count).to eq(0)
  end

  it "validations: Should create a new fighter (all stats present)" do
    Fighter.create(name: "Fighter 1", health: 100, power: 10, luck: rand(1.0..2.5))
    Fighter.create(name: "Fighter 2", health: 150, power: 20, luck: rand(1.0..2.5))
    expect(Fighter.count).to eq(2)
  end

  it "validations: Should prevent Fighter with same name" do
    Fighter.create(name: "Fighter Test", health: 100, power: 10, luck: rand(1.0..2.5))
    Fighter.create(name: "Fighter Test", health: 100, power: 10, luck: rand(1.0..2.5))
    expect(Fighter.count).to eq(1)
  end

  it "CRUD: Fighter update working" do
    Fighter.create(name: "Fighter Test", health: 100, power: 10, luck: rand(1.0..2.5))
    Fighter.first.update(name: "Edited name")
    expect(Fighter.first.name).to eq("Edited name")
  end

  it "CRUD: Fighter destroy working" do
    Fighter.create(name: "Fighter Test", health: 100, power: 10, luck: rand(1.0..2.5))
    Fighter.first.destroy
    expect(Fighter.count).to eq(0)
  end

  it "CRUD + Associations: Fighter with fights history destroy should work" do
    Fighter.create(name: "Fighter 1", health: 100, power: 10, luck: rand(1.0..2.5))
    Fighter.create(name: "Fighter 2", health: 150, power: 20, luck: rand(1.0..2.5))
    Weapon.create(name: "fists", attack: 0, defense: 0)
    Weapon.create(name: "sword", attack: 10, defense: 0)
    Weapon.create(name: "shield", attack: 0, defense: 10)
    Fight.create(player: Fighter.first, opponent: Fighter.last, player_weapon: Weapon.first, opponent_weapon: Weapon.last)
    Fighter.first.destroy
    expect(Fighter.count).to eq(1)
  end
end
