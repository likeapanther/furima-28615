class Address < ApplicationRecord
  belongs_to :purchase
  with_options presence: true do
    validates :zip, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id, numericality: {only_integer: true}
    validates :city
    validates :number
    validates :tel,format: { with: /\A\d{11}\z/}
  end
end
