# README

## users　テーブル

| Column          | Type   | Options     | 
| --------------- | ------ | ----------- | 
| nickname        | string | null: false | 
| email           | string | null: false, unique: true | 
| password        | string | null: false | 
| last_name       | string | null: false | 
| first_name      | string | null: false | 
| last_name_kana  | string | null: false | 
| first_name_kana | string | null: false | 
| birtyday        | date   | null: false | 

### Association
- has_many :items
- has_many :purchases

## items テーブル
| Column          | Type    | Options     | 
| --------------- | ------- | ----------- | 
| user_id         | integer | null: false, foreign_key: true | 
| title           | string  | null: false | 
| description     | text    | null: false | 
| category_id     | integer | null: false | 
| condition_id    | integer | null: false | 
| fee_id          | integer | null: false | 
| prefecture_id   | integer | null: false | 
| day_id          | integer | null: false | 
| price           | integer | null: false | 

### Association
- belongs_to :user
- has_one :purchase

## purchases テーブル
| Column     | Type       | Options                        | 
| ---------- | ---------- | ------------------------------ | 
| item_id    | integer    | null: false, foreign_key: true | 
| user_id    | integer    | null: false, foreign_key: true | 

### Association
- belongs_to :item
- belongs_to :user
- has_one :address

## addresses  テーブル
| Column         | Type    | Options                        | 
| -------------- | ------- | ------------------------------ | 
| purchase_id    | integer | null: false, foreign_key: true |
| zip            | string  | null: false                    | 
| prefecture_id  | integer | null: false                    | 
| city           | string  | null: false                    | 
| number         | string  | null: false                    | 
| building       | string  |                                | 
| tel            | string  | null: false                    | 

### Association
- belongs_to :purchase