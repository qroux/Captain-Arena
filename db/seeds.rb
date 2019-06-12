Fighter.create!(name: "Kirby", health: 100, power: 20, photo: Rails.root.join("app/assets/images/kirby.jpg").open)
Fighter.create!(name: "Donkey Kong", health: 150, power: 10, photo: Rails.root.join("app/assets/images/donkey.jpg").open)

Weapon.create!(name: "Fists", attack: 0, defense: 0)
Weapon.create!(name: "Sword", attack: 10, defense: 0)
Weapon.create!(name: "Shield", attack: 0, defense: 10)
