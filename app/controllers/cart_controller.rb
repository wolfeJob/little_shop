class CartController < ApplicationController
include ActionView::Helpers::TextHelper

  def show
  end

  def create #add item to cart
    @item = Item.find(params[:item_id])
    # @cart = Cart.new(session[:cart])
    cart.add_item(@item.id)
    session[:cart] ||= cart.contents
    quantity = cart.count_of(@item.id)
    flash[:notice] = "You now have #{pluralize(quantity, "copy")} of #{@item.name} in your cart."
    redirect_to '/items'
  end

  def empty
    session.delete(:cart)
    redirect_to '/cart'
  end

  def delete_item
    cart.contents.delete(params[:item_id])
    redirect_to '/cart'
  end


private

  def item_params
    params.permit(:name, :description, :price, :inventory, :image)
  end
end
