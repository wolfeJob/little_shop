class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @item = Item.find(params[:item_id])
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @item = @review.item
    @review.update(review_params)
    redirect_to "/items/#{@item.id}"
  end

  def create
    @item = Item.find(params[:item_id])
    @review = @item.reviews.new(review_params)
    if @review.save
      redirect_to "/items/#{@item.id}"
    else
      generate_flash(@review)
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @item = @review.item
    Review.destroy(params[:id])
    redirect_to "/items/#{@item.id}"
  end

  # def average_rating
  #   @reviews.average(:rating)
  # end

  private

  def review_params
    params.permit(:title, :content, :rating)
  end
end
