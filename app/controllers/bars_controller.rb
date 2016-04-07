class BarsController < ApplicationController

  def index
    @bars = Bar.all
  end

  def show
    @bar = Bar.find(params[:id])
    @review = Review.new
    @reviews = @bar.reviews.order(created_at: :asc)
  end

  def new
    @bar = Bar.new
  end

  def create
    @bar = Bar.new(bar_params)
    @bar.user = current_user

    if @bar.save
      flash[:notice] = "Bar added successfully."
      redirect_to bar_path(@bar)
    else
      flash[:error] = @bar.errors.full_messages.join(". ")
      render :new
    end
  end

  def edit
    @bar = Bar.find(params[:id])
  end

  def update
    @bar = Bar.find(params[:id])
    if @bar.update_attributes(bar_params)
      flash[:notice] = "Bar updated successfully."
      redirect_to bars_path(@bar)
    else
      flash[:error] = @bar.errors.full_messages.join(". ")
      render :edit
    end
  end

  def destroy
    @bar = Bar.find(params[:id])
    if @bar.destroy!
      flash[:notice] = "#{@bar.name} has been deleted."
      redirect_to bars_path
    end
  end

  private

  def bar_params
    params.require(:bar).permit(:name, :description)
  end

end
