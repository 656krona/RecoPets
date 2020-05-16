# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(id:1, name:"yuka", email:"a@a", password:"111111")

Admin.create(id:1, email: 'admin@admin', password: "111111")

Pet.find_or_create_by(id:1, user_id: 1, name:"まろん")
Pet.find_or_create_by(id:2, user_id: 1, name:"ジョン")

Hospital.find_or_create_by(id:1, name: "もりやま動物病院", postcode: "111-1111", prefecture_name: "埼玉県", address_city: "さいたま市浦和区", address_street: "岸町3丁目5番地", phone: "048-000-0000")
Hospital.find_or_create_by(id:2, name: "バード・クリニック", postcode: "111-1111", prefecture_name: "鹿児島県", address_city: "鹿児島市", address_street: "和田1丁目1番地", phone: "099-000-0000")
Hospital.find_or_create_by(id:3, name: "さやま動物病院", postcode: "111-1111", prefecture_name: "埼玉県", address_city: "さいたま市常盤区", address_street: "3丁目5番地", phone: "048-000-0000")
Hospital.find_or_create_by(id:4, name: "アネラどうぶつ病院", postcode: "111-1111", prefecture_name: "福島県", address_city: "いわき市平大町", address_street: "1丁目3番地", phone: "0246-000-0000")
Hospital.find_or_create_by(id:5, name: "根本獣医科医院", postcode: "111-1111", prefecture_name: "広島県", address_city: "尾道市栗原町", address_street: "4丁目12番地", phone: "0848-000-0000")
Hospital.find_or_create_by(id:6, name: "ペットメディカルセンター", postcode: "111-1111", prefecture_name: "沖縄県", address_city: "沖縄県沖縄市", address_street: "松本4丁目2番地", phone: "098-000-0000")
Hospital.find_or_create_by(id:7, name: "サクラペットクリニック", postcode: "111-1111", prefecture_name: "広島県", address_city: "広島市西区", address_street: "2丁目10番地", phone: "0848-000-0000")

Category.find_or_create_by(id:1, name: "犬")
Category.find_or_create_by(id:2, name: "猫")
Category.find_or_create_by(id:3, name: "鳥類")
Category.find_or_create_by(id:4, name: "ハムスター")
Category.find_or_create_by(id:5, name: "うさぎ")
Category.find_or_create_by(id:6, name: "その他小動物")
Category.find_or_create_by(id:7, name: "爬虫類")
Category.find_or_create_by(id:8, name: "動物病院")

Item.find_or_create_by(id:1, user_id: 1, name: "ペットフード", days: 90, amount: 100 )
Item.find_or_create_by(id:2, user_id: 1, name: "おやつ", days: 60, amount: 70 )
Item.find_or_create_by(id:3, user_id: 1, name: "トイレシート", days: 60, amount: 100 )
Item.find_or_create_by(id:4, user_id: 1, name: "消毒", days: 90, amount: 50 )
Item.find_or_create_by(id:5, user_id: 1, name: "ささみ缶詰", days: 30, amount: 60 )


