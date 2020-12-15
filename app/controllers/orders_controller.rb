class OrdersController < ApplicationController
def index
  @item = Item.find(params[:id])
  @order = Order.new
end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
end


