require "mailgun"

class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:destroy]
  before_action :require_access, only: [:edit, :destroy]

  def index
    @bars = Bar.all
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
    @vote_total = Vote.group(:review_id).sum(:count)

    if @review.save
      flash[:notice] = "Review added"
      ReviewMailer.new_review(@review, @bar).deliver_later
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
    if @review.destroy && admin_signed_in?
      flash[:alert] = "#{@review.title} has been deleted"
      redirect_to admins_path
    elsif @review.destroy
      flash[:alert] = "#{@review.title} has been deleted"
      redirect_to bar_path(@bar)
    else
      flash[:alert] = "Error: Review has not been deleted"
      redirect_to bar_path(@bar)
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :bar_id, :user_id, :rating)
  end

  def require_access
    unless admin_signed_in?
    @bar = Bar.find(params[:bar_id])
    @review = Review.find(params[:id])
    @user = @review.user
    if @user != current_user
      flash[:error] = "You do not have permission to make this change."
      redirect_to bar_path(@bar)
    end
  end
  end
end
