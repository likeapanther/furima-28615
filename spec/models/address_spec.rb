require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end  

  describe "住所の入力" do
    it "住所が登録できるとき" do
      expect(@address).to be_valid
    end
  end
end

