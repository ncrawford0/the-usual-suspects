require 'pry'
require 'mailgun'
class ReviewController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
  end
  
  def update
    @review = Review.find(params[:id])
    if @review.update_attributes(review_params)
      flash[:notice] = "Review updated."
    else
      flash[:notice] = "Review was not updated."
    end
  end

  def new
    @review = Review.new
  end

  def create
    @bar = Bar.find(params[:bar_id])
    @review = Review.new(review_params)
    @review.bar = @bar
    @review.user = current_user
    Binding.pry
    if @review.save!
      redirect bars_path
    else
      lash[:notice] = "Bar did not save."
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy!
      flash[:notice] = "Review deleted."
      redirect_to bars_path
    else
      lash[:notice] = "Bar did not delete."
    end
  end

  def review_params
    params.require(:review).permit(:title, :body, :bar_id, :user_id, :rating)
  end
end
