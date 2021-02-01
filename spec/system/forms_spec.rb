require 'rails_helper'

RSpec.describe 'Forms', type: :system do
  before do
    @address = FactoryBot.build(:address)
    @purchase = FactoryBot.build(:purchase)
  end

  context '購入できるとき' do
    it '正しい入力' do
      basic_pass item_purchase_index_path(@purchase.item_id)
      fill_in 'カード情報',	with: 4_242_424_242_424_242
    end
    it 'クレジットカードの決済ができるとき' do
    end
  end

  context '購入できないとき' do
    it 'わからない' do
    end
  end
end
