class Address < ApplicationRecord
  belongs_to :order

  validates :postal_code, :area , :prefectures_id, :city, :district, :phone_number, :order, presence: true
end
