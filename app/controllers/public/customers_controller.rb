class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
    @customers = Customer.all
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to public_customers_my_page_path
    else
      render :edit
    end
  end

  def edit
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
  end

end
