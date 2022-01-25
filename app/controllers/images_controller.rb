class ImagesController < ApplicationController


        # GET /products or /products.json
        def index
            @images = Image.all
          end
        
          # # GET /products/1 or /products/1.json
          def show
              puts "----------------------------------------------------------------------"
              puts params
              puts params['id']
              @image= Image.find(params['id'])
              puts @image.img_name
              puts "-----------------------------------------------------------------------"
          end
        
          # # GET /products/new
          def new
             @image = Image.new
           end
        
          # # GET /products/1/edit
          def edit
            puts "----------------------------------------------------------------------------------------------------------"
            puts request
            puts params
            @image= Image.find(params['id'])
            puts request.method
          end
        
          # # POST /products or /products.json
          def save
            puts "================================================================="
            #puts request.method
            puts params
            @image=Image.create(params.permit(:img_name,:author_id,:book_id))
            if @image.valid?
              puts '---------------valid user----------------'
              redirect_to '/images'
            else 
              puts '-----------------not valid-----------------'
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
            puts "============================================================================="
            @image = Image.find(params[:id])
            @image.destroy
          end
          
end
