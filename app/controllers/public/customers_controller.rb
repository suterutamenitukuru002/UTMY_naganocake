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
        flash[:notice] = "会員情報を更新出来ました。"
        redirect_to public_customers_mypage_path
      else
      render :edit
      end
  end


  def check
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
  def mypage_params
    params.require(:customer).permit(:family_name, :first_name, :family_name_kana, :first_name_kana,:email, :postcode, :telephone_number, :address)
  end

end
