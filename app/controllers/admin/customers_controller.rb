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
    if @customer.update(genre_params)
     redirect_to admin_customers_path
    else
     @customers = Customer.find(params[:id])
     render :edit
    end
  end

private
 def mypage_params
  params.require(:customer).permit(:family_name, :first_name, :family_name_kana, :first_name_kana,:email, :postcode, :telephone_number, :address)
 end
end