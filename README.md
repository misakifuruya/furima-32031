# テーブル設計



## useers テーブル

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
- has_one  :buy



## items テーブル

| Column           | Type          | Options                        |
| ---------------- | ------------- | ------------------------------ |
| title            | string        | null: false                    |
| seller           | references    | null: false, foreign_key: true |
| explanation      | text          | null: false                    |
| category_id      | string        | null: false                    |
| status_id        | integer       | null: false                    |
| shipping cost_id | integer       | null: false                    |
| area_id          | integer       | null: false                    |
| days_id          | integer       | null: false                    |
| price            | integer       | null: false                    |

### Association

- has_one    :buy
- belongs_to :user



## buy テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :shipping address



## shipping address

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| postal code     | integer | null: false |
| address1        | string  | null: false |
| address2        | string  | null: false |
| address3        | string  | null: false |
| address4        | string  | null: false |
| phone number    | integer | null: false |

### Association

- belongs_to :buy



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
