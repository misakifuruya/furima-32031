class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show ]
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end

  end


  private

  def item_params
    params.require(:item).permit(:title, :user, :explanation, :category_id, :status_id, :shipping_cost_id, :area_id, :days_id, :price, :image).merge(user_id: current_user.id)
  end

end
