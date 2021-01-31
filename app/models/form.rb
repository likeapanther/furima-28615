class Form
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :purchase_id, :zip, :prefecture_id, :city, :number, :building, :tel

  with_options presence: true do
    validates :zip
    validates :prefecture_id
    validates :city
    validates :number
    validates :tel
  end

  with_options numericality: {only_integer: true} do
    validates :prefecture_id
  end

  def save
    #item_idの取得の仕方がわからない
    @purchase = Purchase.create(user_id: user_id,item_id: 12)
    Address.create(purchase_id: @purchase.id, zip: zip, prefecture_id: prefecture_id, city: city, number: number, building: building, tel: tel)

  end
end