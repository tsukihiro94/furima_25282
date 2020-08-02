class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to_active_hash :category
  belongs_to_active_hash :item_status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :region
  belongs_to_active_hash :delivery_day
  belongs_to :user
  has_one_attached :image
  has_one :order
  has_one_attached :image

  with_options presence: true do
    validates :category_id, :item_status, :delivery_fee, :region, :delivery_day, numericality: {other_than: 1 }
  end
  
end
