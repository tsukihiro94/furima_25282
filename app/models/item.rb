class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to_active_hash :category, :item_status, :delivery_fee, :region
  belongs_to :user
  has_one_attached :image
  has_one :order
  has_one_attached :image

  with_option presence: true do
    validates :category_id, :item_status, :delivery_fee, :region, numericality: {other_than: 1 }
  end
  
end
