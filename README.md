# テーブル設計



## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :orders



## items テーブル

| Column           | Type          | Options                        |
| ---------------- | ------------- | ------------------------------ |
| title            | string        | null: false                    |
| user             | references    | null: false, foreign_key: true |
| explanation      | text          | null: false                    |
| category_id      | string        | null: false                    |
| status_id        | integer       | null: false                    |
| shipping cost_id | integer       | null: false                    |
| area_id          | integer       | null: false                    |
| schedule_id      | integer       | null: false                    |
| price            | integer       | null: false                    |

### Association

- has_one    :order
- belongs_to :user





## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :address




## address

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal code     | string     | null: false                    |
| area            | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| city            | string     | null: false                    |
| district        | string     |                                |
| phone number    | string     | null: false                    |
| order           | references | null: false, foreign_key: true |

### Association

- belongs_to :order



# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
