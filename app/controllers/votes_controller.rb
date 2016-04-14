class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :pre_vote

  def upvote
    if @value.count == 1
      @value.count -= 1
    else
      @value.count = 1
    end
    @value.save
    @vote_total = Vote.group(:review_id).sum(:count)
    respond_to do |format|
      format.json { render json: @vote_total[@review.id] }
      format.html { redirect_to bar_path(@bar) }
    end
  end

  def downvote
    if @value.count == -1
      @value.count += 1
    else
      @value.count = -1
    end
    @value.save
    @vote_total = Vote.group(:review_id).sum(:count)
    respond_to do |format|
      format.json { render json: @vote_total[@review.id] }
      format.html { redirect_to bar_path(@bar) }
    end
  end

  private

  def pre_vote
    @review = Review.find(params[:review_id])
    @value = Vote.find_or_initialize_by(review: @review, user: current_user)
    @bar = @review.bar
  end
end
