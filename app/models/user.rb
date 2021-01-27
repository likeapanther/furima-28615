class User < ApplicationRecord
  VALID_PASSWORD_REGEX = /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/.freeze
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  with_options presence: true do
    validates :nickname
    validates :birthday
    with_options format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ } do
      validates :last_name
      validates :first_name
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :last_name_kana
      validates :first_name_kana 
    end
  end
end
