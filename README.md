# テーブル設計　

## users テーブル　

| Column             | Type   | Options     |　
| ------------------ | ------ | ----------- |　
| name               | string | null: false |　
| email              | string | null: false |　
| encrypted_password | string | null: false |　
| birthday           | string | null: false |　

- has_many :items　
- has_many :purchases　


## items テーブル　

| Column   | Type       | Options                        |　
| ------   | ------     | -----------                    |　
| user     | references | null: false, foreign_key: true |　
| image    | text       | null: false                    |　
| name     | string     | null: false                    |　
| detail   | string     | null: false                    |　
| category | string     | null: false                    |　
| ship fee | string     | null: false                    |　
| category | string     | null: false                    |　
| region   | string     | null: false                    |　
| ship days| string     | null: false                    |　
| status   | string     | null: false                    |　
| price    | int        | null: false                    |　

### Association　

- belongs_to :user　
- has_one :purchase　


## Purchases テーブル　

| Column | Type       | Options                        |　　
| ------ | ---------- | ------------------------------ |　　
| user   | references | null: false, foreign_key: true |　
| item   | references | null: false, foreign_key: true |　

### Association　

- belongs_to :user　
- belongs_to :item　
- has_one  :address　



## addresses テーブル　

| Column     | Type       | Options                        |　
| ------     | ---------- | ------------------------------ |　
| user       | references | null: false, foreign_key: true |　
| postcode   | string     | null: false                    |　
| prefecture | string     | null: false                    |　
| city       | string     | null: false                    |　
| street     | string     | null: false                    |　
| building   | string     |                                |　
| phone      | string     | null: false                    |
　

### Association　

- has_one :purchase　



　　