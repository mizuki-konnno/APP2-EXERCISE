class UsersController < ApplicationController
  before_action :authenticate_user!


  def show
   @user = User.find(params[:id])
   @books = @user.books
   @book=Book.new
   @meetings = Meeting.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
  if @user.update(user_params)
    redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
  else
    render:edit
  end
  end

  def index
    @user = User.all
    @book=Book.new
  end

   before_action :authenticate_user!
    before_action :correct_user,only: [:edit]

    def correct_user
        @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
    end


 private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end