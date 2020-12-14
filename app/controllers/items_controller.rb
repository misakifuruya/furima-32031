class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit]
  before_action :set_item, only: [:edit, :show, :update]

  def index
    @items = Item.order('created_at DESC')
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

  def show
  end

  def edit

     if user_signed_in? && current_user.id == @item.user_id
       
     else
      redirect_to root_path

     end

  end

  def update
    if user_signed_in? && current_user.id == @item.user_id
      @item.update(item_params)

    else
      render :index

    end


    if @item.update(item_params)
      redirect_to item_path

    else
      render :edit
    end



  end

  private

  def item_params
    params.require(:item).permit(:title, :user, :explanation, :category_id, :status_id, :shipping_cost_id, :area_id, :schedule_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless current_user.id == Item.find(params[:id]).user_id
  end


end
