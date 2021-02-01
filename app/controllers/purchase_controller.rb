class PurchaseController < ApplicationController
  before_action :authenticate_user!
  #before_action :item_params, only: [:index,:create]

  def index
    #購入情報に商品がない場合
    if Purchase.find_by(item_id: params[:item_id]).nil?
      #閲覧しているユーザーと出品者が違う場合
      if current_user.id != Item.find_by_id(params[:item_id]).user_id
        @form = Form.new
        @user = current_user
        @item = Item.find(params[:item_id])
        
      else
        redirect_to root_path
      end
  else
    redirect_to root_path
  end
  end

  def create
    #すでに購入されているとき
    if Purchase.find_by(item_id: params[:item_id]).nil?
      @item = Item.find(params[:item_id])
      @form = Form.new(form_params)
      if @form.valid?
        pay_item
        @form.save
        return redirect_to root_path
      else
        render :index
      end
    else
      redirect_to root_path
    end
  end

  private

  def form_params
    params.require(:form).permit(:zip,:prefecture_id, :city, :number, :building, :tel).merge(user_id: current_user.id,token: params[:token],item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: form_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
end




