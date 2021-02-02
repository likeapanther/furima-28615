class PurchaseController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index,:create]
  before_action :check_item, only: [:index,:create]

  def index
      # 閲覧しているユーザーと出品者が違う場合
      if current_user.id != Item.find_by_id(params[:item_id]).user_id
        @form = Form.new
        @user = current_user

      else
        redirect_to root_path
      end

  end

  def create
      @form = Form.new(form_params)
      if @form.valid?
        pay_item
        @form.save
        redirect_to root_path
      else
        render :index
      end
  end

  private

  def check_item
    #すでに購入されているとき
    
    binding.pry
    
    if Purchase.find_by(item_id: params[:item_id]).nil?
    else
      redirect_to root_path
    end

  end

  def form_params
    params.require(:form).permit(:zip, :prefecture_id, :city, :number, :building, :tel).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: form_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
