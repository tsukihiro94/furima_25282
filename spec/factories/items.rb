FactoryBot.define do
  factory :item do
    name            {"きこりん"}
    info            {"檜の模型"}
    category_id     {"3"}
    item_status_id  {"2"}
    delivery_fee_id {"3"}
    region_id       {"7"}
    delivery_day_id {"2"}
    price           {"5000"}
    association :user
  end
end
