class BooksController < ApplicationController
  before_action :set_book, except: [:index, :new, :create]


  def index
    @books = Book.all
  end

  def show

  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = 'Book has been created'
      redirect_to @book
    else
      flash[:danger] = "Book has not been created"
      render :new
    end
  end

  def edit

  end

  def update
     if @book = Book.update(book_params)
      flash[:success] = 'Book has been updated'
      redirect_to @book
    else
      flash[:danger] = "Book has not been updated"
      render :new
    end
  end

  def destroy
    @book.destroy
    flash[:success] = "Book has been deleted"
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :isbn, :page_count, :price, :description,
      :published_at, :publisher_id)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
