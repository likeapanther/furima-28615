class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
  end

  def create
    Item.create(item_params)
  end

  def new
    @item = Item.new
  end
  

  private
  
  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)

  end
end
