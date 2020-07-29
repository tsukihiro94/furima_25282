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
| birth_year _id   | integer | null: false |
| birth_month_id   | integer | null: false |
| birth_day_id     | integer | null: false |

### Association
- has_many :items
- has_many :addresses


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
| user_id        | references   | null: false, foreign_key: true|


### Association
- belongs_to :user
- has_one_attached :image


## address テーブル
| Column       | Type         | Options                       |
| -------------| -------------| ------------------------------|
| city         | string       | null: false                   |
| street_number| string       | null: false                   |
| building_name| string       |                               |
| postal_code  | string       | null: false                   |
| phone        | integer      | null: false                   |
| item_id      | references   | null: false, foreign_key: true|

### Association
- belongs_to :item

