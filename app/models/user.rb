class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :email, uniqueness: { case_sensitive: false }
    validates :nickname
    validates :last_name 
    validates :first_name
    validates :last_name_kana, format: {with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,}
    validates :first_name_kana, format: {with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,}
    validates :birthday
  end
end
