class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :description
    validates :image
    validates :prefecture_id
    validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :fee_id
    validates :day_id
  end
  
end
