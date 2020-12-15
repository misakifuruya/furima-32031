class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def create
      order = Order.create(order_params)
      Address.create(address_params(order))
      redirect_to action: :index
  end

    private

  def order_params
    params.permit(:user, :item)
  end

  def address_params(order)
    params.permit(:postal_code, :area, :city, :prefectures_id, :district, :phone_number).merge(user_id: user.id, item_id: item.id)
    
  end

end


