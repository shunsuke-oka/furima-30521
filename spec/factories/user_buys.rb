FactoryBot.define do
  factory :user_buy do
    post_num { "123-4567" }
    area_id { 7 }
    city_name { '名古屋' }
    city_num { '1-1' }
    building_name { "マンション" }
    phone_num { '08012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
