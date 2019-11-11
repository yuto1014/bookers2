class UsersController < ApplicationController
before_action :authenticate_user!
before_action :correct_user, only: [:edit, :update]

def index
	@user = current_user
	@users = User.page(params[:id]).reverse_order
	@book = Book.new
	@books = Book.all
end

def show
	@book = Book.new
	@user = User.find(params[:id])
	@books = @user.books.page(params[:page]).reverse_order
end

def edit
	@user = User.find(params[:id])
end

def update
	@user = User.find(params[:id])
	@user.update(user_params)
	redirect_to user_path(@user.id)
	flash[:success] = 'mydate was successfully update.'
	flash[:error] = 'error'
end

private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  def correct_user
	@user = User.find(params[:id])
	if current_user != @user
		redirect_to user_path(current_user.id)
	end
    end

end
