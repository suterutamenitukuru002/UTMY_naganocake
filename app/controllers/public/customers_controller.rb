class Public::CustomersController < ApplicationController
  def mypage
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def infomation
    @customer = Customer.all
      if @customer.update(mypage_params)
        flash[:notice] = "You have updated mypage successfully."
        redirect_to public_customers_mypage_path
      else
      render :edit
      end
  end


  def check
  end

  def is_withdraw
    current_customer.update(status: 'withdrawn')
    reset_session
    redirect_to root_path, notice: 'Successfully withdraw from Ecommerce'
  end

  private
  def mypage_params
    params.require(:customer).permit(:family_name, :first_name, :family_name_kana, :first_name_kana,:email, :postcode, :telephone_number, :address)
  end

end
