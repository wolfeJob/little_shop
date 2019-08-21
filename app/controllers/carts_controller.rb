class CartsController < ApplicationController
include ActionView::Helpers::TextHelper

  def create #add item to cart
    @item = Item.find(params[:item_id])
    # @cart = Cart.new(session[:cart])
    cart.add_item(@item.id)
    session[:cart] ||= cart.contents
    quantity = cart.count_of(@item.id)
    flash[:notice] = "You now have #{pluralize(quantity, "copy")} of #{@item.name} in your cart."
    redirect_to '/items'


  #
  #   song = Song.find(params[:song_id])
  # @cart = Cart.new(session[:cart])
  # @cart.add_song(song.id)
  # session[:cart] = @cart.contents
  # quantity = @cart.count_of(song.id)
  # flash[:notice] = "You now have #{pluralize(quantity, "copy")} of #{song.title} in your cart."
  # redirect_to songs_path
  end

private

  def item_params
    params.permit(:name, :description, :price, :inventory, :image)
  end
end
