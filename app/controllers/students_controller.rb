class StudentsController < ApplicationController
    def index
        @students = Student.all
      end
    
    def show
          puts "----------------------------------------------------------------------"
          puts params
          puts params['id']
          @student= Student.find(params['id'])
          puts @student.first_name
          puts "-----------------------------------------------------------------------"
      end
    
    def new
        @student = Student.new
      end

    def create
      @student=Student.create(student_params)
      if @student.valid?
        puts '---------------valid user----------------'
        redirect_to '/students'
      else 
        puts '-----------------not valid-----------------'
        # flash[:errors] = student.errors.full_messages
        puts @student.errors.full_messages
        puts @student.errors.any?
        render 'new'
      end
    end
    

    def edit
    puts"--------------------------------------------------------"
    @student= Student.find(params['id'])
    end
    
    def update
    @student = Student.find(params[:id])
    @student.update(student_params)
    if @student.valid?
        puts '---------------valid user----------------'
        redirect_to students_path
      else 
        puts '-----------------not valid-----------------'
        puts @student.errors.full_messages
        puts @student.errors.any?
        render 'edit'
      end
    
    end

      def destroy
        puts "============================================================================="
        @student = Student.find(params[:id])
        @student.destroy
        redirect_to '/students'
      end

    private
    def student_params
        params.require(:student).permit(:first_name,:last_name,:DOB,:department,:Terms_Of_Condition)
    end
    
end
