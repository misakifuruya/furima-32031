class Address < ApplicationRecord
  belongs_to :order
  belongs_to :area

  validates :postal_code, :area , :prefectures_id, :city, :district, :phone_number,  presence: true


  validates :phone_number, format: { with: /\A[0-9]+\z/i }
  validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/}
  validates :district, format: { with: /\A[ぁ-んァ-ン一-龥]/}
end
