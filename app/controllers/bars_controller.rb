class BarsController < ApplicationController

  def index
    @bars = Bar.all
  end

  def new
    @bar = Bar.new
  end

  def create
    @bar = Bar.new(bar_params)

    if @bar.save
      flash[:notice] = "Bar added successfully"
      redirect_to bar_path(@bar)
    else
      flash[:error] = @bar.errors.full_messages.join(". ")
      render :new
    end
  end

  def show
    @bar = Bar.find(params[:id])
  end

  private

  def bar_params
    params.require(:bar).permit(:name, :description)
  end

end
