class ReviewsController < ApplicationController
  def new
    @item = Item.find(params[:item_id])
  end

  def edit
    @review = Review.find(params[:id])
    @item = @review.item
  end

  def update
    @review = Review.find(params[:id])
    @item = @review.item
    review = Review.find(params[:id])
    review.update(review_params)
    redirect_to "/items/#{@item.id}"
  end

  def destroy
    @review = Review.find(params[:id])
    @item = @review.item
    Review.destroy(params[:id])
    redirect_to "/items/#{@item.id}"
  end


  private

  def review_params
    params.permit(:title, :content, :rating)
  end
end
