require "mailgun"

class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_access, only: [:edit, :destroy]

  def require_access
    @bar = Bar.find(params[:bar_id])
    @review = Review.find(params[:id])
    @user = @review.user
    if @user != current_user
      flash[:error] = "You do not have permission to make this change."
      redirect_to bar_path(@bar)
    end
  end

  def index
    @bars = Bar.all
  end

  def index
    @reviews = Review.all
  end

  def edit
    @bar = Bar.find(params[:bar_id])
    @review = Review.find(params[:id])
    @reviews = @bar.reviews.order(created_at: :asc)
  end

  def update
    @review = Review.find(params[:id])
    @bar = Bar.find(params[:bar_id])
    if @review.update_attributes(review_params)
      flash[:notice] = "Review updated."
      redirect_to bar_path(@bar)
    else
      flash[:notice] = @review.errors.full_messages.join(". ")
      render :edit
    end
  end

  def create
    current_user
    @bar = Bar.find(params[:bar_id])
    @review = Review.new(review_params)
    @review.bar = @bar
    @review.user = @current_user
    @reviews = @bar.reviews.order(created_at: :asc)

    if @review.save
      flash[:notice] = "Review added"
      redirect_to bar_path(@bar)
    else
      flash[:alert] = @review.errors.full_messages.join(". ")
      render "bars/show"
    end
  end

  def destroy
    current_user
    @bar = Bar.find(params[:bar_id])
    @review = Review.find(params[:id])
    if @review.destroy
      flash[:alert] = "Review has been deleted"
      redirect_to bar_path(@bar)
    else
      flash[:alert] = "Error: Review has not been deleted"
      redirect_to bar_path(@bar)
    end
  end

  def review_params
    params.require(:review).permit(:title, :body, :bar_id, :user_id, :rating)
  end
end
