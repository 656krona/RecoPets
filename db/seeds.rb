# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(id:1, name:"yuka", email:"a@a", password:"111111")

Pet.find_or_create_by(id:1, user_id: 1, name:"まろん")

Hospital.find_or_create_by(id:1, name: "もりやま動物病院", postcode: "111-1111", prefecture_name: "埼玉県", address_city: "さいたま市浦和区", address_street: "岸町3丁目5番地", phone: "048-000-0000")
Hospital.find_or_create_by(id:2, name: "バード・クリニック", postcode: "111-1111", prefecture_name: "鹿児島県", address_city: "鹿児島市", address_street: "和田1丁目1番地", phone: "099-000-0000")

Category.find_or_create_by(id:1, name: "犬")
Category.find_or_create_by(id:2, name: "猫")
Category.find_or_create_by(id:3, name: "鳥類")
Category.find_or_create_by(id:4, name: "ハムスター")
Category.find_or_create_by(id:5, name: "うさぎ")
Category.find_or_create_by(id:6, name: "その他小動物")
Category.find_or_create_by(id:7, name: "爬虫類")
Category.find_or_create_by(id:8, name: "動物病院")
