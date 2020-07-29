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
- has_many :products
- has_many :addresses


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

