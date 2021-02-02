require 'rails_helper'

RSpec.describe Form, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('/files/test_image.jpg')
    @token = 'aaa'
    @form = FactoryBot.build(:form, user_id: @user, item_id: @item, token: @token)
  end

  describe '購入処理' do
    context '購入できるとき' do
      it 'すべての欄が埋まっているとき' do
        expect(@form).to be_valid
      end

      it '建物名からでも登録が可能なこと' do
        @form.building = nil
        expect(@form).to be_valid
      end
    end
    context '住所が登録できないとき' do
      it '配送先の情報として、郵便番号が必須であること' do
        @form.zip = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Zip can't be blank")
      end
      it '配送先の情報として、都道府県が必須であること' do
        @form.prefecture_id = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
      end
      it '配送先の情報として、市区町村が必須であること' do
        @form.city = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("City can't be blank")
      end
      it '配送先の情報として、番地が必須であること' do
        @form.number = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Number can't be blank")
      end
      it '配送先の情報として、電話番号が必須であること' do
        @form.tel = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Tel can't be blank")
      end
      it '郵便番号にはハイフンが必要であること（123-4567となる）' do
        @form.zip = '1111111'
        @form.valid?
        expect(@form.errors.full_messages).to include('Zip is invalid')
      end
      it '電話番号にはハイフンは不要であること' do
        @form.tel = '000-0000-0000'
        @form.valid?
        expect(@form.errors.full_messages).to include('Tel is invalid')
      end
      it '電話番号には11桁以内であること' do
        @form.tel = 111_111_111_111
        @form.valid?
        expect(@form.errors.full_messages).to include('Tel is invalid')
      end
      it 'user_idが空の場合' do
        @form.user_id = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空の場合' do
        @form.item_id = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
