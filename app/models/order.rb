class Order < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one    :address
  belongs_to :area

  validates :area_id, numericality: { other_than: 1 }
  validates :user, :item,  presence: true
end
