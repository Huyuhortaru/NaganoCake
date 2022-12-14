class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to public_customers_my_page_path
    else
      render :edit
    end
  end

  def edit
    @customer = current_customer
  end
  
  def unsubscribe
  end
  
  def withdraw
    customer = current_customer
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end
    

  private
  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_deleted)
  end

end
