class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customers = Customer.find(params[:id])
  end

  def edit
    @customers = Customer.find(params[:id])
  end

  def update
    @customers = Customer.find(params[:id])
    if @customers.update(customer_params)
     redirect_to admin_customer_path(@customers.id)
    else
     @customer = Customer.all
     render :edit
    end
  end

   def is_withdraw
    @customer = Customer.find(current_customer.id)
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end


private
 def customer_params
  params.require(:customer).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :email, :postcode, :telephone_number, :address)
 end
end