class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture, :city, :area_id, :district, :phone_number

  validates :area_id, numericality: { other_than: 1 }
  validates :user_id, :item_id,  presence: true

  validates :postal_code, :area_id, :prefectures, :city, :phone_number,  presence: true


   validates :phone_number, format: { with: /\A[0-9]+\z/i }
   validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/}
   validates :district, format: { with: /\A[ぁ-んァ-ン一-龥]/}

def save
  order = Order.create(user_id: user.id, item_id: item.id)
  Address.create(postal_code: postal_code, prefecture: prefecture, city: city, area_id: area.id, district: district, phone_number: phone_number, order_id: order.id)

end

end