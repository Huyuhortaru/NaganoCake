class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to admin_orders_path
    else
      render :edit
    end
  end

  private
  def order_params
    params.require(:order).permit(:name, :status)
  end

end
