# テーブル設計　

## users テーブル　


| Column                 | Type   | Options                  |　
| ------------------     | ------ | -----------              |　
| nickname               | string | null: false              |　
| email                  | string | null: false ,unique: true|　
| encrypted_password     | string | null: false              |　
| first_name             | string | null: false              |
| last_name              | string | null: false              |
| first_name_kana        | string | null: false              |　
| last_name_kana         | string | null: false              |
| birthday               | date   | null: false              |　

- has_many :items　
- has_many :purchases　


## items テーブル　

| Column      | Type       | Options                        |　
| ------      | ------     | -----------                    |　
| user        | references | null: false, foreign_key: true |　
| name        | string     | null: false                    |　
| detail      | text       | null: false                    |　
| category_id | integer    | null: false                    |
| ship_fee_id | integer    | null: false                    |
| region_id   | integer    | null: false                    |
| ship_day_id | integer    | null: false                    |
| status_id   | integer    | null: false                    |
| price       | integer    | null: false                    |　

### Association　

- belongs_to :user　
- has_one :purchase　


## purchases テーブル　

| Column | Type       | Options                        |　　
| ------ | ---------- | ------------------------------ |　　
| user   | references | null: false, foreign_key: true |　
| item   | references | null: false, foreign_key: true |　

### Association　

- belongs_to :user　
- belongs_to :item　
- has_one  :address　



## addresses テーブル　

| Column        | Type       | Options                        |　
| ------        | ---------- | ------------------------------ |　
| purchase      | references | null: false, foreign_key: true |　
| postcode      | string     | null: false                    |　
| region_id     | integer    | null: false                    |
| city          | string     | null: false                    |　
| street        | string     | null: false                    |　
| building      | string     |                                |　
| phone         | string     | null: false                    |
　

### Association　

- belongs_to :purchase　



　　