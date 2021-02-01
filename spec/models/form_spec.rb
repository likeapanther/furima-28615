require 'rails_helper'

RSpec.describe Form, type: :model do
  before do
    @address = FactoryBot.build(:address)
    @purchase = FactoryBot.build(:purchase)
  end
=begin
  describe "住所の入力" do
    context "住所が登録できるとき" do
      expect(@address).to be_valid
    end
    context "住所が登録できないとき" do
      it '配送先の情報として、郵便番号が必須であること' do 
        @address.zip = nil 
        @address.valid?
        expect(@address.errors.full_messages).to include("Zip can't be blank")
      end
      it '配送先の情報として、都道府県が必須であること' do 
        @address.prefecture_id = nil 
        @address.valid? 
        expect(@address.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
      end
      it '配送先の情報として、市区町村が必須であること' do 
        @address.city = nil 
        @address.valid? 
        expect(@address.errors.full_messages).to include("City can't be blank")
      end
      it '配送先の情報として、番地が必須であること'    do 
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
        @address.zip = "1111111"
        @address.valid?
        expect(@address.errors.full_messages).to include("Zip is invalid")
      end
      it '電話番号にはハイフンは不要であること' do
        @address.tel = "000-0000-0000"
        @address.valid? 
        expect(@address.errors.full_messages).to include("Tel is invalid")
      end
      it '電話番号には11桁以内であること' do
        @address.tel = 111111111111
        @address.valid? 
        expect(@address.errors.full_messages).to include("Tel is invalid")
      end
      it '購入が完了したら、トップページまたは購入完了ページに遷移すること' do
        visit
      end
    end
  end
=end
  describe  "クレジットカードの購入情報" do
    it "クレジットカードの決済ができるとき" do
        expect(@purchase).to be_valid
    end

    
    it "クレジットカードの決済ができないとき" do
    end
  end
    
end
