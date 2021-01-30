class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_item, only:[:edit,:show]
  def index
    @items = Item.all.order("created_at DESC")
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render new_item_path
    end
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
  end

  def destroy
    
  end

  private

  def item_params
    params.require(:item).permit(:title, :image, :description, :category_id, :condition_id, :fee_id, :prefecture_id, :day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
