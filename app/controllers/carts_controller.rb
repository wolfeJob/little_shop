class CartsController < ApplicationController

  def create #add item to cart
    @item = Item.find(params[:item_id])
    flash[:notice] = "You now have 1 copy of #{@item.name} in your cart."
    redirect_to '/items'
  end

private

  def item_params
    params.permit(:name, :description, :price, :inventory, :image)
  end
end
