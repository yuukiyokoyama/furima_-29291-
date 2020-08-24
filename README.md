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

- has_many :user_item
- has_many :items
- has_many :comments

## items テーブル
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| photo | string | null: false |
| name | string | null: false |
| explanation | text | null: false |
| value | integer | null: false |
| category | integer | null: false |
| condition | integer | null: false |
| delivery_fee | integer | null: false |
| shipping_origin | integer | null: false |
| days_until_shipping | integer | null: false |
| user | references | null: false,foreign_key: true  |

### Association

- has_one :user_item
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

##  item_purchasesテーブル
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| user | references | null: false,foreign_key: true |
| item | references | null: false,foreign_key: true |
| shipping_address | references | null: false,foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one:shipping_address

##  shipping_addressesテーブル
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| postal code | string | null: false |
| prefectures | integer | null: false |
| city | string | null: false |
| address | string | null: false |
| building name | string |  |
| phone number | string | null: false |

### Association
- belongs_to:item_purchas