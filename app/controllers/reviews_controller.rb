# require 'mailgun'

class ReviewsController < ApplicationController
  # def index
  #   @reviews = Review.all
  # end

  # def show
  #   @review = Review.find(params[:id])
  # end
  #
  # def edit
  #   @review = Review.find(params[:id])
  # end

  # def update
  #   @review = Review.find(params[:id])
  #   if @review.update_attributes(review_params)
  #     flash[:notice] = "Review updated."
  #   else
  #     flash[:notice] = "Review was not updated."
  #   end
  # end
  #
  # def new
  #   @review = Review.new
  # end

  def create
    current_user
    @bar = Bar.find(params[:bar_id])
    @review = Review.new(review_params)
    @review.bar = @bar
    @review.user = @current_user

    if @review.save
      redirect_to bar_path(@bar)
    else
      flash[:alert] = "Failed to save review"
      render 'bars/show'
    end
  end

  # def destroy
  #   @bar = Bar.find(params[:bar_id])
  #   @review = Review.find(params[:id])
  #   if @review.destroy!
  #     flash[:notice] = "The Review Has Been Deleted."
  #     # redirect_to bar_path(@bar)
  #   else
  #     flash[:notice] = "The Review Was Unable To Be Removed"
  #     # render :'bar/show'
  #   end
  # end

  def review_params
    params.require(:review).permit(:title, :body, :bar_id, :user_id, :rating)
  end
end
