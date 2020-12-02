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



## items テーブル

| Column        | Type          | Options                        |
| ------------- | ------------- | ------------------------------ |
| image         | ActiveStorage |                                |
| title         | string        | null: false                    |
| seller        | references    | null: false, foreign_key: true |
| explanation   | string        | null: false                    |
| category      | string        | null: false                    |
| status        | string        | null: false                    |
| shipping cost | string        | null: false                    |
| area          | string        | null: false                    |
| days          | string        | null: false                    |
| price         | integer       | null: false                    |

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
- has_one    :shipping address



## shipping address

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| credit          | string | null: false |
| expiration date | string | null: false |
| security        | string | null: false |
| postal code     |
| address1        |
| address2        |
| address3        |
| address4        |
| phone number    |

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
