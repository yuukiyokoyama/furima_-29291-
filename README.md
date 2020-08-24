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

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| family_name | string | null: false |
| first_name | string | null: false |
| family_name_kana　| string | null: false |
| first_name_kana | string | null: false |
| birthday | date | null: false |

### Association

- has_many :items
- has_many :comments

## items テーブル
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| photo | string | null: false |
| name | string | null: false |
| explanation | string | null: false |
| value | integer | null: false |
| category | string | null: false |
| condition | string | null: false |
| delivery_fee | integer | null: false |
| shipping_origin | string | null: false |
| days_until_shipping | string | null: false |
| user | references | null: false,foreign_key: true  |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| content | text | null: false |
| user | string | null: false,foreign_key: true |
| item | string | null: false,foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item