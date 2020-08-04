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

  with_options presence: true do
    validates :image
    validates :name, length:{maximum: 40} 
    validates :info, length:{maximum: 1000}
    validates :price, numericality: {only_interger: :ture},inclusion: {in: 300..9999999, message: "out of setting range"}
    validates :category_id, :item_status_id, :delivery_fee_id, :region_id, :delivery_day_id, numericality: {other_than: 1 , message: "Select"}
  end
  
end
