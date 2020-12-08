require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '出品がうまくいくとき' do
      it '全ての情報が正しく存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかない時' do
      it 'titleが空だと出品できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Title can't be blank"
      end

      it 'explanationが存在しないと出品できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end

      it 'category_idが存在しないと出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category is not a number'
      end

      it 'status_idが存在しないと出品できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Status is not a number'
      end

      it 'shipping_cost_idが存在しないと出品できない' do
        @item.shipping_cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Shipping cost is not a number'
      end

      it 'area_idが存在しないと出品できない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Area is not a number'
      end

      it 'days_idが存在しないと出品できない' do
        @item.days_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Days is not a number'
      end

      it 'priceが存在しないと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end

      it 'imageが存在しないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it '' do
      end
    end
  end
end
