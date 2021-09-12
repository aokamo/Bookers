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
      if @book.save
        redirect_to book_path(@book), notice:'Your Book was successfully created.'
      else
        @books = Book.all
        render :index
      end
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save(book_params)
      redirect_to :book, notice:'Your Book was successfully updated.'
    else
      render :edit
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: 'The book was successfully destroyed.'
    
  end  
  
  private
    def book_params
    params.require(:book).permit(:title, :body)
    end
end
