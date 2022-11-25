class Admin::CustomersController < ApplicationController
  
  def index
    @customer = Customer.new
    @customers = Customer.page(params[:page])
  end
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  
  private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :email, :is_delete)
  end
end
