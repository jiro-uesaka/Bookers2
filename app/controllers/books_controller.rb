class BooksController < ApplicationController

  def index
    @user = User.find(current_user.id)
    @book = Book.new
    @books = Book.all
  end
  
  def show
    @post_book = Book.find(params[:id])
    @user = User.find(@post_book.user.id)
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @user = User.find(current_user.id)
      @books = Book.all
      render :index
    end
  end
  
  def edit
    is_matching_login_user
    @book = Book.find(params[:id])
    @user = User.find(@book.user.id)
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
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
  
  def is_matching_login_user
    user_id = Book.find(params[:id])
    login_user_id = current_user.id
    if(user_id.user.id.to_i != login_user_id)
      redirect_to books_path
    end
  end
  
end
