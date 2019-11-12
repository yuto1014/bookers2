class BooksController < ApplicationController
before_action :authenticate_user!, only: [:new, :create, :index, :show, :edit, :update, :destroy]
before_action :correct_user, only: [:edit, :update]

	def top
	end

	def about
	end

	def new
		@book = Book.new
	end

	def create
		@user = User.new
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
		redirect_to book_path(@book)
	else
		render :index
	end
	    flash[:success] = 'Book was successfully created.'
	end

	def index
		@user = User.new
		@book = Book.new
		@books = Book.page(params[:book]).reverse_order
		@users = User.all
	end

	def show
		@books = Book.new
		@book = Book.find(params[:id])
		@user = User.find(@book.user_id)
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		book = Book.new(book_params)
		@book = Book.find(params[:id])
		@book.user_id = current_user.id
		if @book.update(book_params)
		 redirect_to book_path(@book.id)
		else
			render :index
		end
		flash[:success] = 'Book was successfully updated.'
	end

	def destroy
		book = Book.find(params[:id])
		book.destroy
		redirect_to books_path
	end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
	def correct_user
		@book = Book.find(params[:id])
		if current_user != @book.user
			redirect_to books_path
		end
    end

end
