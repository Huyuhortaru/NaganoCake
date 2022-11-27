class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  
  def top
    @order = Order.new
    @orders = Order.page(params[:page])
  end

  private
  def order_params
    params.require(:order).permit(:name, :status)
  end

end
