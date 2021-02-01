class Form
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :price, :token, :purchase_id, :zip, :prefecture_id, :city, :number, :building, :tel

  validates :token, presence: true

  def save
    @purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(purchase_id: @purchase.id, zip: zip, prefecture_id: prefecture_id, city: city, number: number, building: building, tel: tel)
  end
end
