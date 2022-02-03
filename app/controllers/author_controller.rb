class AuthorController < ApplicationController
  # GET /products or /products.json
  def index
    @authors = Author.all
  end

  # GET /products/1 or /products/1.json
  def show
      @author= Author.find(params['id'])
  end

  # GET /products/new
  def new
      @author = Author.new
  end

  # GET /products/1/edit
  def edit
    @author= Author.find(params['id'])
  end

  # POST /products or /products.json
  def save
    @author=Author.create(params.permit(:first_name,:last_name,:DOB,:email))
    if @author.valid?
      redirect_to '/author'
    else 
      redirect_to '/author/new'
    end
  end

  def update
    @author = Author.find(params[:id])
    @author.update(book_params)
    redirect_to author_path
  end

  def book_params
    params.require(:author).permit(:first_name,:last_name,:DOB,:email)
  end
  
  def destroy
    @author = Author.find(params[:id])
    @author.destroy
  end
      
end
