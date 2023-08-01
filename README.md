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
- has_one :adresses


## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
| image  | text   | null: false |
| detail | string | null: false |
| price  | int    | null: false |

### Association

- belongs_to :user
- has_one :purchases


## Purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| adress | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one  :items
- has_one  :adresses



## addresses テーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| postcode  | int        | null: false                    |
| prefecture| string     | null: false                    |
| city      | string     | null: false                    |
| street    | string     | null: false                    |
| building  | string     | null: false                    |
| phone     | int        | null: false                    |

### Association

- has_one :purchases
- has_one :users


