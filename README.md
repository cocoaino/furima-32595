# DB 設計

## users table

|Column             |Type   |Options                   |
|-------------------|-------|--------------------------|
|nickname           |string |null: false               |
|email              |string |null: false, unique: true |
|encrypted_password |string |null: false               |
|last_name          |string |null: false               |
|first_name         |string |null: false               |
|last_name _kana    |string |null: false               |
|first_name_kana    |string |null: false               |
|birthday           |date   |null: false               |

### Association

* has_many :items
* has_many :orders

## items table

|Column              |Type    |Options                        |
|--------------------|--------|-------------------------------|
|user_id             |integer |null: false, foreign_key: true |
|name                |string  |null: false                    |
|price               |integer |null: false                    |
|description         |text    |null: false                    |
|category_id         |integer |null: false                    |
|status_id           |integer |null: false                    |
|shipping_charge_id  |integer |null: false                    |
|shipping_area_id    |integer |null: false                    |
|shipping_day_id     |integer |null: false                    |

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
* belongs_to :item
* has_one :address

## addresses table

|Column             |Type    |Options                        |
|-------------------|--------|-------------------------------|
|order_id           |integer |null: false, foreign_key: true |
|postal_code        |string  |null: false                    |
|shipping_area_id   |integer |null: false                    |
|city               |string  |null: false                    |
|address            |string  |null: false                    |
|building_name      |string  |                               |
|phone_number       |string  |null: false                    |

### Association

* belongs_to :order