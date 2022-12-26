class Public::AddressesController < ApplicationController

  def index
    @address = Address.new
    @addresses = Address.all
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @addresses = Address.all

    if @address.save
      redirect_to "/public/addresses"
    else
      render :index
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])

    if @address.update(address_params)
      redirect_to public_addresses_path
    else
      render :edit
    end
  end

  private
  def address_params
    params.require(:address).permit(:name, :address, :postal_code, :customer_id)
  end


end
