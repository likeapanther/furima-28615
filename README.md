# README

## users テーブル

| Column          | Type   | Options     | 
| --------------- | ------ | ----------- | 
| nickname        | string | null: false | 
| email           | string | null: false, unique: true | 
| password        | string | null: false | 
| last_name       | string | null: false | 
| first_name      | string | null: false | 
| last_name_kana  | string | null: false | 
| first_name_kana | string | null: false | 
| birthday        | date   | null: false | 

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

## テスト項目
### ユーザーモデル
パスワードが必須であること
パスワードは6文字以上であること
パスワードは半角英数字混合であること
パスワードは確認用を含めて2回入力すること
新規登録・ログイン共にエラーハンドリングができていること（適切では無い値が入力された場合、情報は受け入れられず、エラーメッセージを出力させる）
ユーザー本名が、名字と名前がそれぞれ必須であること
ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること
ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること
ユーザー本名のフリガナは全角（カタカナ）で入力させること
生年月日が必須であること
### 商品出品
画像は1枚必須であること(ActiveStorageを使用すること)
商品名が必須であること
商品の説明が必須であること
カテゴリーの情報が必須であること
商品の状態についての情報が必須であること
配送料の負担についての情報が必須であること
発送元の地域についての情報が必須であること
発送までの日数についての情報が必須であること
価格についての情報が必須であること
価格の範囲が、¥300~¥9,999,999の間であること
販売価格は半角数字のみ保存可能であること