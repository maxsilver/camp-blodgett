class CabinsController < ApplicationController
  before_action :set_cabin, only: [:show, :edit, :update]

  def index
    @cabins = Cabin.all
  end

  def show
  end

  def new
    @cabin = Cabin.new
  end

  def edit
  end

  def create
    @cabin = Cabin.new(cabin_params)
    if @cabin.save
      redirect_to cabins_path
    else
      render 'new'
    end
  end

  def update
    if @cabin.update(cabin_params)
      redirect_to cabins_path
    else
      render 'edit'
    end
  end


  private

  def set_cabin
    @cabin = Cabin.find(params[:id])
  end

  def cabin_params
    params.require(:cabin).permit!
  end
end
