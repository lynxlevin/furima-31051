# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(id: 1, nickname: "buyer", email: "buyer@test.com", family_name_kanji: "購入", first_name_kanji: "太郎", family_name_katakana: "コウニュウ", first_name_katakana: "タロウ", birthday: "1990-01-01", password: "test2222")
User.create(id: 2, nickname: "seller", email: "seller@test.com", family_name_kanji: "出品", first_name_kanji: "太郎", family_name_katakana: "シュッピン", first_name_katakana: "タロウ", birthday: "1990-01-01", password: "test2222")
