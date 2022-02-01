class ImagesController < ApplicationController
  # GET /products or /products.json
  def index
    @images = Image.all
  end

  # GET /products/1 or /products/1.json
  def show
      @image= Image.find(params['id'])
  end

  # GET /products/new
  def new
      @image = Image.new
    end

  # GET /products/1/edit
  def edit
    @image= Image.find(params['id'])
  end

  # POST /products or /products.json
  def save
    @image=Image.create(params.permit(:img_name,:author_id,:book_id))
    if @image.valid?
      redirect_to '/images'
    else 
      redirect_to '/images/new'
    end
  end

  def update
    @image = Image.find(params[:id])
    @image.update(book_params)
    redirect_to images_path
  end

  def book_params
    params.require(:image).permit(:img_name, :author_id,:book_id)
  end
  
  def destroy
    @image = Image.find(params[:id])
    @image.destroy
  end
  
end
