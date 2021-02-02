require 'rails_helper'

RSpec.describe Form, type: :model do
  before do
    @address = FactoryBot.build(:address)
    @purchase = FactoryBot.build(:purchase)
  end

  describe '購入処理' do
    context '購入できるとき' do
      it "すべての欄が埋まっているとき" do
      expect(@address).to be_valid
      end
      

      it '建物名からでも登録が可能なこと'do
      @address.building = nil
      expect(@address).to be_valid
      end
    end
    context '住所が登録できないとき' do
      it '配送先の情報として、郵便番号が必須であること' do
        @address.zip = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Zip can't be blank")
      end
      it '配送先の情報として、都道府県が必須であること' do
        @address.prefecture_id = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
      end
      it '配送先の情報として、市区町村が必須であること' do
        @address.city = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("City can't be blank")
      end
      it '配送先の情報として、番地が必須であること' do
        @address.number = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Number can't be blank")
      end
      it '配送先の情報として、電話番号が必須であること' do
        @address.tel = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Tel can't be blank")
      end
      it '郵便番号にはハイフンが必要であること（123-4567となる）' do
        @address.zip = '1111111'
        @address.valid?
        expect(@address.errors.full_messages).to include('Zip is invalid')
      end
      it '電話番号にはハイフンは不要であること' do
        @address.tel = '000-0000-0000'
        @address.valid?
        expect(@address.errors.full_messages).to include('Tel is invalid')
      end
      it '電話番号には11桁以内であること' do
        @address.tel = 111_111_111_111
        @address.valid?
        expect(@address.errors.full_messages).to include('Tel is invalid')
      end
    end
  end
end
