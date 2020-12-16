FactoryBot.define do
  factory :order_address do
    postal_code     {"123-4567"}
    area_id         {2} 
    prefecture      {"あああ"}
    city            {"ああ"}
    district        {"ああ"}
    phone_number    {"09012345678"}
  end
end
