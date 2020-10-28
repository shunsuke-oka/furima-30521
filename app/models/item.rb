class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :text
    validates :price
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery
  belongs_to_active_hash :area
  belongs_to_active_hash :day

  with_options presence: true do
    validates :category
    validates :status
    validates :delivery
    validates :area
    validates :day
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_id
    validates :area_id
    validates :day_id
  end
end
