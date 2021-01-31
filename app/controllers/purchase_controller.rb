class PurchaseController < ApplicationController
  def index
    @form = Form.new
    @user = current_user
    @item = Item.find(params[:item_id])
  end

  def create
    
    @form = Form.new(form_params)
    if @form.valid?
      @form.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def form_params
    params.require(:form).permit(:zip,:prefecture_id, :city, :number, :building, :tel).merge(user_id: current_user.id)
  end

  def item_params
    params.require(:item).permit(:price).merge(user_id: curren_user.id)
  end

  def purchase_params
    params.require(:purchase).permit(:price).merge(token: params[:token])
  end
end
