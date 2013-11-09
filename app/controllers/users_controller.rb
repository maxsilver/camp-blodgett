class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
    unless User.count <= 1
      @user.destroy
    end
    redirect_to users_path
  end



  private

  def set_user
    @user = User.find(params[:id])
  end
end
