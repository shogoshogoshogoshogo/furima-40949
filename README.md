Furima ER

usersテーブル
email(string型, NOT NULL, ユニーク制約)
encrypted_password(string型, NOT NULL)
name(string型, NOT NULL)
nickname(string型, NOT NULL)
birthrates(string型, NOT NULL)


itemsテーブル

name(string型, NOT NULL)
description(text型, NOT NULL)
price(text型, NOT NULL)
user(reference型, NOT NUU, 外部キー)
order(reference型, NOT NULL, 外部キー)

ordersテーブル

user(reference型, NOT NULL、外部キー)
items(reference型、NOT NULL, 外部キー)
address(has_one)
order_date(string型, NOT NULL)

addressesテーブル
postal_code(string型, NOT NULL)
prefecture(string型, NOT NULL)
city(string型, NOT NULL)
street(string型, NOT NULL)
building_name(string型, NOT NULL)
phone_number(string型, NOT NULL)
order(reference型, NOT NULL, belongs_to)
