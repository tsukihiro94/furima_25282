class Address < ApplicationRecord
  belongs_to :user


  with_opition presence: true do
    validates :postal_code, format: {with: /\A\d{11}\z/}
    validates :region_id, :street_number, :buildimg_name,
    validates :phone, format: {with: /\A\d{3}[-]\d{4}\z/ }
  end
end
