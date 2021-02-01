require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @purchase = FactoryBot.build(:purchase)
    @item.image = fixture_file_upload('/files/test_image.jpg')
  end  

  describe "商品の購入" do
    it "商品が購入できるとき" do
      expect(@purchase).to be_valid
    end

    
  end
  
end
