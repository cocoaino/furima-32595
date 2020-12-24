# DB 設計

## users table

|Column             |Type   |Options     |
|-------------------|-------|------------|
|nickname           |string |null: false |
|email              |string |null: false |
|encrypted_password |string |null: false |
|family_name        |string |null: false |
|first_name         |string |null: false |
|family_name _kana  |string |null: false |
|first_name_kana    |string |null: false |
|birth_day          |date   |null: false |

### Association

* has_many :items
* has_many :orders

## items table

|Column             |Type    |Options                        |
|-------------------|--------|-------------------------------|
|user_id            |integer |null: false, foreign_key: true |
|name               |string  |null: false                    |
|price              |string  |null: false                    |
|description        |string  |null: false                    |
|category           |string  |null: false                    |
|status             |string  |null: false                    |
|shipping_charges   |string  |null: false                    |
|shipping_area      |string  |null: false                    |
|shipping_days      |string  |null: false                    |

### Association

* belongs_to :user
* has_one :order

## orders table

|Column             |Type    |Options                        |
|-------------------|--------|-------------------------------|
|user_id            |integer |null: false, foreign_key: true |
|item_id            |integer |null: false, foreign_key: true |

### Association

* belongs_to :user
* has_one :order
* has_one :address

## addresses table

|Column             |Type    |Options                        |
|-------------------|--------|-------------------------------|
|user_id            |integer |null: false, foreign_key: true |
|postal_code        |integer |null: false                    |
|prefecture         |string  |null: false                    |
|city               |string  |null: false                    |
|address            |string  |null: false                    |
|building_name      |string  |null: false                    |
|phone_number       |string  |null: false                    |

### Association

* has_one :order