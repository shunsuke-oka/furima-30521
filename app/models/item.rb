class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :text
    validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 9_999_999 }
    validates :category_id
    validates :status_id
    validates :delivery_id
    validates :area_id
    validates :day_id
  end
  validates :price, format: { with: /\A[0-9]+\z/ }

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_id
    validates :area_id
    validates :day_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery
  belongs_to_active_hash :area
  belongs_to_active_hash :day
end
