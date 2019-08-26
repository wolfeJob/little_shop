class OrdersController < ApplicationController
  def new
    @items = cart.display_cart
  end

private

  def order_params
    params.permit(:username, :address, :city, :state, :zipcode)
  end
end
