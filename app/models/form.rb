class Form
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :price, :token, :purchase_id, :zip, :prefecture_id, :city, :number, :building, :tel
  
  #with_options presence: true do
    #validates :zip, format: { with: /\A\d{3}[-]\d{4}\z/}
    #validates :prefecture_id
    #validates :city
    #validates :number
    #validates :tel,format: { with: /^\d{11}$/}
    #validates :price
    #validates :token
  #end

  #with_options numericality: {only_integer: true} do
  #  validates :prefecture_id
  #end

  def save
    @purchase = Purchase.create(user_id: user_id,item_id: item_id)
    Address.create(purchase_id: @purchase.id, zip: zip, prefecture_id: prefecture_id, city: city, number: number, building: building, tel: tel)
  
  end
end