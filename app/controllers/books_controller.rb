class BooksController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

  def new
    @user = current_user
    @book = Book.new
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have creatad book successfully"
      redirect_to book_path(@book)
    else
      @user = current_user
      flash[:error_messages] = @book.errors.full_messages
      render :index
    end
  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
    @user = current_user
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params) && @book.user == current_user
      flash[:notice] = "You have update book successfully"
      redirect_to book_path(@book)
    else
      flash[:error_messages] = @book.errors.full_messages
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.user == current_user
      @book.destroy
      redirect_to books_path
    else
      redirect_to books_path
    end
  end

  private
    def book_params
      params.require(:book).permit(:title, :body)
    end

    def correct_user
      book = Book.find(params[:id])
      user = book.user
      if current_user != user
        redirect_to books_path
      end
    end

end
