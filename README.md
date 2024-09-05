Furima ER

usersテーブル
nickname(string型, null: false)
email(string型, null: false, unique: true)
encrypted_password(string型, null: false)
family_name(string型, null: false)
first_name(string型, null: false)
family_name_kana(string型, null: false)
first_name_kana(string型, null: false)
birthdate(date型, null: false)

itemsテーブル

image_file(string型, null: false)
name(string型, null: false)
description(text型, null: false)
category(string型, null: false)
status(string型, null: false)
responsibility(string型, null: false)
region(string型, null: false)
time(string型, null:false)
price(integer型, null: false)
user(reference型, null: false, user_id)
order(reference型, null: false, order_id)

ordersテーブル

user(reference型, null: false、user_id)
items(reference型、null: false, item_id)



addressesテーブル
order(reference型, null: false, belongs_to: order)
postal_code(string型, null: false)
prefecture(integer型, null: false)
city(string型, null: false)
street(string型, null: false)
building_name(string型)
phone_number(string型, null: false)

