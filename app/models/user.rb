class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z{6,}/i
    validates :password, format: { with: VALID_PASSWORD_REGEX }
    validates :email, uniqueness: { case_sensitive: false }
    validates :nickname
    validates :last_name 
    validates :first_name
    validates :last_name_kana, format: {with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,}
    validates :first_name_kana, format: {with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,}
    validates :birthday
  end
end
