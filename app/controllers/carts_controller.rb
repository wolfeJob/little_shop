class CartsController < ApplicationController
  def create #add item to cart
    redirect_to '/items'
  end
end
