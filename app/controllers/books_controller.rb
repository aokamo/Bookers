class BooksController < ApplicationController
  def new
    
  end

  def edit
    @book = Book.find(params[:id])
  end

  def show
    @book = Book.find(params[:id])
  end

  def index
    @books = Book.all
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: "Your Book was successfully created." }
      end
    end
  end
  
  def update
  end
  
  private
    def book_params
    params.require(:book).permit(:title, :body)
    end
end
