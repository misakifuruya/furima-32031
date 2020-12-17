class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture, :city, :area_id, :district, :phone_number, :token


  with_options presence: true do
  validates :area_id, numericality: { other_than: 1 }
  validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
  validates :phone_number, format: { with: /\A[0-9]{10,11}\z/ }
  validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :user_id
  validates :item_id
  validates :prefecture
  validates :token
   end


  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, area_id: area_id, district: district, phone_number: phone_number, order_id: order.id)
  end
end
