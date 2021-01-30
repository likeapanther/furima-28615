require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('/files/test_image.jpg')
  end
  describe '出品商品の保存' do
    context '出品商品が保存できる場合' do
      it 'すべての項目が埋まっていると保存される' do
        expect(@item).to be_valid
      end
    end
    context '出品商品が保存できない場合' do
      it '画像は1枚必須であること(ActiveStorageを使用すること)' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が必須であること' do
        @item.title = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it '商品の説明が必須であること' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーの情報が必須であること' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 0')
      end
      it '商品の状態についての情報が必須であること' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 0')
      end
      it '配送料の負担についての情報が必須であること' do
        @item.fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Fee must be other than 0')
      end
      it '発送元の地域についての情報が必須であること' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it '発送までの日数についての情報が必須であること' do
        @item.day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Day must be other than 0')
      end
      it '価格についての情報が必須であること' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格の範囲が、¥300未満であること' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it '価格の範囲が、¥10,000,000の以上であること' do
        @item.price = 100000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it '販売価格は半角数字のみ保存可能であること' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
    end
  end
end
