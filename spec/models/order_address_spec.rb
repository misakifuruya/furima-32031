require 'rails_helper'
RSpec.describe OrderAddress, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @order_address =  FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

  describe '購入の保存' do
    context '購入の保存がうまくいく時' do
      it "適切に情報を入力すると購入ができる" do
         expect(@order_address).to be_valid
      end
    end


    context '購入の保存がうまくいかない時' do
      it "postal_codeにはハイフンがないと購入できない" do
        @order_address.postal_code = '0000000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code is invalid"
      end

      it "phone_numberにはハイフンがあると購入できない" do
        @order_address.phone_number= '000-0000-00000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number is invalid"
      end

      it "phone_numberは、11桁以内でないと購入できない" do
        @order_address.phone_number= '00000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number is invalid"
      end

      it "postal_codeが存在しないと購入できない" do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code can't be blank"

      end

      it "area_idが存在しないと購入できない" do
        @order_address.area_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Area can't be blank"

      end

      it "prefectureが存在しないと購入できない" do
        @order_address.prefecture= ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Prefecture can't be blank"
      end

      it "cityが存在しないと購入できない" do
        @order_address.prefecture= ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Prefecture can't be blank"
      end


      it "phone_numberが存在しないと購入できない" do
        @order_address.phone_number= ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number can't be blank"
      end

        it "" do
        end
  
      end
    end
  end

