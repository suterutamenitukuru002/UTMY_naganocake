class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customers = Customer.find(params[:id])
  end

  def edit
    @customers = Customer.find(params[:id])
  end

  def update
    @customers = Customer.find(params[:id])
    if @customers.update(customers_params)
     redirect_to admin_customer_path(@customers.id)
    else
     @customer = Customer.all
     render :edit
    end
  end

private
 def customer_params
  params.require(:customer).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :email, :postcode, :telephone_number, :address)
 end
end