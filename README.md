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
| birtyday        | int    | null: false | 

### Association
- has_many :items
- has_may :purchases

## items テーブル
| Column          | Type    | Options     | 
| --------------- | ------- | ----------- | 
| user_id         | integer | null: false, foreign_key: true | 
| title           | string  | null: false | 
| description     | text    | null: false | 
| category        | string  | null: false | 
| condition       | string  | null: false | 
| delivery_fee    | integer | null: false | 
| delivery_locate | string  | null: false | 
| delivery_days   | date    | null: false | 
| price           | integer | null: false | 

### Association
- belongs_to :user
- has_one :purchase

## purchases テーブル
| Column     | Type    | Options                        | 
| ---------- | ------- | ------------------------------ | 
| item_id    | integer | null: false, foreign_key: true | 
| user_id    | integer | null: false, foreign_key: true | 
| zip        | integer | null: false                    | 
| prefecture | string  | null: false                    | 
| city       | string  | null: false                    | 
| number     | string  | null: false                    | 
| building   | string  |                                | 
| tel        | integer | null: false                    | 

### Association
- belongs_to :item
- belongs_to :user