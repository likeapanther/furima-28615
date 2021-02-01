require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @purchase = FactoryBot.build(:purchase)
  end  

  describe "商品の購入" do
    it "商品が購入できるとき" do
      expect(@purchase).to be_valid
    end
    context "商品が購入できないとき" do
      it 'クレジットカード情報は必須であり、正しいクレジットカードの情報で無いときは決済できないこと' do 
        
        binding.pry
        
      end
    end
    
  end
  
end
