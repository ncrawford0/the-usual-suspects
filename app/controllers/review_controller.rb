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
      # redirect and flash message
    else
      # render and flash message
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
    if @review.save!
      # redirect
    else
      # flash alert and render
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy!
      # flash[:notice] = "Review deleted."
      # redirect_to bars_path
    # else
      # flash and render
    end
  end

  def review_params
    params.require(:review).permit(:title, :body, :bar_id, :user_id, :rating)
  end
end
