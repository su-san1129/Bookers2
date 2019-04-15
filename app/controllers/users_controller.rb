class UsersController < ApplicationController
		before_action :authenticate_user!
before_action :correct_user, only: [:edit, :update]



  def index
    @users = User.all.order(created_at: :desc)
    @book = Book.new
  end

  def show
  	@user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to user_path(@user.id), notice: "user was successfully updated."
    else
      render :edit
    end
  end

  private

    def user_params
  	 params.require(:user).permit(:username, :introduction, :profile_image)
    end

  def correct_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to users_path
    end
  end
end
