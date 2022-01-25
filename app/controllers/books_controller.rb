class BooksController < ApplicationController
      
        # GET /products or /products.json
        def index
          @books = Book.all
        end
      
        # # GET /products/1 or /products/1.json
        def show
            puts "----------------------------------------------------------------------"
            puts params
            puts params['id']
            @book= Book.find(params['id'])
            puts @book.name
            puts "-----------------------------------------------------------------------"
        end
      
        # # GET /products/new
        def new
           @book = Book.new
         end
      
        # # GET /products/1/edit
        def edit
          puts "----------------------------------------------------------------------------------------------------------"
          puts request
          puts params
          @book= Book.find(params['id'])
          puts request.method
        end
      
        # # POST /products or /products.json
        def save
          puts "================================================================="
          #puts request.method
          puts params
          @book=Book.create(params.permit(:name,:price,:author_id))
          if @book.valid?
            puts '---------------valid user----------------'
            redirect_to '/books'
          else 
            puts '-----------------not valid-----------------'
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
          puts "============================================================================="
          @book = Book.find(params[:id])
          @product.destroy
        end
        
end
