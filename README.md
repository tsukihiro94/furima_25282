# テーブル設計

## users テーブル

| Column           | Type    | Options     |
| -----------------| --------| ----------- |
| nickname         | string  | null: false |
| email            | string  | null: false |
| password         | integer | null: false |
| confirm_password | integer | null: false |
| family_name      | string  | null: false |
| first_name       | string  | null: false |
| family_name_kana | string  | null: false |
| first_name_kana  | string  | null: false |
| birthday         | date    | null: false |

### Association
- has_many :items
- has_many :addresses
- has_one :order


## items テーブル
| Column         | Type         | Options                       |
| ---------------| -------------| ------------------------------|
| name           | string       | null: false                   |
| info           | text         | null: false                   |
| category_id    | integer      | null: false                   |
| item_status_id | integer      | null: false                   |
| delivery_fee_id| integer      | null: false                   |
| region_id      | integer      | null: false                   |
| delivery_day_id| integer      | null: false                   |
| price          | integer      | null: false                   |
| user           | references   | null: false, foreign_key: true|


### Association
- belongs_to :user
- has_one_attached :image
- has_one :order

## addresses テーブル
| Column       | Type         | Options                       |
| -------------| -------------| ------------------------------|
| postal_code  | string       | null: false                   |
| region_id    | integer      | null: false                   |
| city         | string       | null: false                   |
| street_number| string       | null: false                   |
| building_name| string       |                               |
| phone        | string       | null: false                   |
| item         | references   | null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :order

## orders テーブル
| Column       | Type         | Options                       |
| -------------| -------------| ------------------------------|
| user         | references   | null: false, foreign_key: true|
| item         | references   | null: false, foreign_key: true|

### Association
- has_one :address
- belongs_to :user
- belongs_to :item