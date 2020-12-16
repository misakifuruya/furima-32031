class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end


  def create
    @item = Item.find(params[:item_id])
    
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to item_path
    else
      render action: :index
    end
  end


    private

    def order_params
      params.require(:order_address).permit(:user_id, :item_id, :postal_code, :area_id, :city, :prefecture, :district, :phone_number)
    
  end
end


