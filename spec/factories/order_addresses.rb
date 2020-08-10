FactoryBot.define do
  factory :order_address do
    postal_code { '111-2222' }
    region_id { "3" }
    city { '港区' }
    street_number { '2-3-47' }
    building_name { '白山ビル' }
    phone { '09033225566' }
  end
end
