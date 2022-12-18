class Public::AddressesController < ApplicationController

  def index
    @address = Address.new
    @addresses = Address.all
  end
  
  def create
    @address = Address.new(address_params)
    @addresses = Address.all

    if @address.save
      redirect_to "/public/addresses"
    else
      render :index
    end
  end

  private
  def address_params
    params.require(:address).permit(:name, :address, :postal_code, :customer_id)
  end


end
