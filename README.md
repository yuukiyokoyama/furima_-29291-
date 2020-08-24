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
| category | integer | id: 1 |
| condition | integer | id: 2 |
| delivery_fee | integer | id: 3 |
| shipping_origin | integer | id: 4 |
| days_until_shipping | integer | id: 5 |
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

##  buyersテーブル
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| credit card information | integer | null: false |
| expiration date | integer | null: false |
| security code | integer | null: false |

### Association

- has_one:Shipping address

##  Shipping addressテーブル
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| postal code | integer | null: false |
| prefectures | string | null: false |
| city | string | null: false |
| address | integer | null: false |
| building name | integer | null: false |
| phone number | integer | null: false |

### Association
- has_one：buyer