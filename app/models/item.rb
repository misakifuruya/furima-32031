class Item < ApplicationRecord
  has_one    :buy
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area, :category, :day, :shipping_cost, :status

  validates :area_id, :days_id, :shipping_cost_id, :category_id, :status_id, numericality: { other_than: 1 }
  validates :image, :title, :user, :explanation, :price, presence: true

  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price
  end

  validates :price, numericality: { greater_than_or_equal_to: 300 }
  validates :price, numericality: { less_than_or_equal_to: 9_999_999 }
end
