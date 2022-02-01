class BooksController < ApplicationController
      
  # GET /products or /products.json
  def index
    @books = Book.all
  end

  #GET /products/1 or /products/1.json
  def show
      @book= Book.find(params['id'])
      
  end

  #GET /products/new
  def new
      @book = Book.new
    end

  #GET /products/1/edit
  def edit
    @book= Book.find(params['id'])
    
  end

  #POST /products or /products.json
  def save
    @book=Book.create(params.permit(:name,:price,:author_id))
    if @book.valid?
      redirect_to '/books'
    else 
      redirect_to '/books/new'
    end
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to books_path
  end

  def book_params
    params.require(:book).permit(:name, :price, :author_id)
  end
  
  def destroy
    @book = Book.find(params[:id])
    @product.destroy
  end
        
end
