class OrderAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :region_id, :city, :street_number, :building_name, :phone, :item_id, :user_id,:token


  with_options presence: true do
    validates :postal_code,  format: {with:/\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city, :street_number
    validates :phone, numericality: {only_interger: :ture, message: "is not a number",format: {with: /\A[0-9]{11}\z/,  meesage:"can't be blank"}}
  end

  def save
    order = Order.create!(user_id: user_id, item_id: item_id)
    Address.create!(postal_code: postal_code, region_id: region_id, city: city, street_number: street_number, building_name: building_name, phone: phone,user_id: user_id)
  end

end