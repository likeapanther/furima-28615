class Purchase < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one :address
  attr_accessor :token, :price
  with_options presence: true do
    validates :user_id
    validates :item_id
  end
end
