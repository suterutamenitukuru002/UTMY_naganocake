class Admin::HomesController < ApplicationController
  def top
    @orders = Order.find(params[:id])
    @customers = Customer.find(params[:id])
  end
end
