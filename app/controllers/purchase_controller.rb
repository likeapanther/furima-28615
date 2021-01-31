class PurchaseController < ApplicationController
  def index
    @form = Form.new
    @user = current_user
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
end
