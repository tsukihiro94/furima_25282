# テーブル設計

## users テーブル

| Column           | Type    | Options     |
| -----------------| --------| ----------- |
| nickname         | string  | null: false |
| mail_address     | string  | null: false |
| password         | integer | null: false |
| confirm_password | integer | null: false |
| family_name      | string  | null: false |
| first_name       | string  | null: false |

### Association
- has_many :products
- has_many :addresses
- has_one :buyer


## products テーブル
| Column  | Type         | Options                       |
| --------| -------------| ------------------------------|
| name    | string       | null: false                   |
| text    | text         | null: false                   |
| price   | integer      | null: false                   |
| user_id | references   | null: false, foreign_key: true|

### Association
- belongs_to :user
- has_one :buyer
- has_one_attached :image


## address テーブル
| Column       | Type         | Options                       |
| -------------| -------------| ------------------------------|
| city         | string       | null: false                   |
| street_number| integer      | null: false                   |
| building_name| string       | null: false                   |
| postal_code  | integer      | null: false                   |
| user_id      | references   | null: false, foreign_key: true|

### Association
- belongs_to :user

## buyers テーブル
| Column       | Type         | Options                       |
| -------------| -------------| ------------------------------|
| card_number  | integer      | null: false                   |
| exp_month    | integer      | null: false                   |
| exp_year     | integer      | null: false                   |
| approval_card| integer      | null: false                   |
| phone_number | integer      | null: false                   |
| user_id      | references   | null: false, foreign_key: true|
| product_id   | references   | null: false, foreign_key: true|
| address_id    | references   | null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product
- belongs_to :address