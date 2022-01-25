class AuthorController < ApplicationController
            # GET /products or /products.json
            def index
                @authors = Author.all
              end
            
              # # GET /products/1 or /products/1.json
              def show
                  puts "----------------------------------------------------------------------"
                  puts params
                  puts params['id']
                  @author= Author.find(params['id'])
                  puts @author.first_name
                  puts "-----------------------------------------------------------------------"
              end
            
              # # GET /products/new
              def new
                 @author = Author.new
               end
            
              # # GET /products/1/edit
              def edit
                puts "----------------------------------------------------------------------------------------------------------"
                puts request
                puts params
                @author= Author.find(params['id'])
                puts request.method
              end
            
              # # POST /products or /products.json
              def save
                puts "================================================================="
                #puts request.method
                puts params
                @author=Author.create(params.permit(:first_name,:last_name,:DOB,:email))
                if @author.valid?
                  puts '---------------valid user----------------'
                  redirect_to '/author'
                else 
                  puts '-----------------not valid-----------------'
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
                puts "============================================================================="
                @author = Author.find(params[:id])
                @author.destroy
              end
      
end
