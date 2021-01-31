class Purchase < ApplicationRecord
  include ActiveModel::Mmodel
  attr_accessor :zip,:prefecture_id, :city, :number, :building, :tel
  belongs_to :item
  belongs_to :user
  has_one :address
  
  def save

  end
end
