class Public::AddressesController < ApplicationController
  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
    flash[:notice] = "配送先を追加しました。"
    redirect_to  addresses_path
  end

  def index
    @addresses = current_customer.addresses
    @address = Address.new

  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
      if @address.update(address_params)
        flash[:notice] = "配送先情報を変更出来ました。"
        redirect_to addresses_path
      end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end

private
  def address_params
    params.require(:address).permit(:postcode, :address, :name)
  end
end
