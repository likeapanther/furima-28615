class PurchaseController < ApplicationController
  def index
    @form = Form.new
    @user = current_user
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @form = Form.new(form_params)
    
    if @form.valid?
      pay_item
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
    params.require(:form).permit(:price).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
end
