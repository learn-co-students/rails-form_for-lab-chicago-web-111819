class StudentsController < ApplicationController
    def new
        @student = Student.new
    end

    def create
        @student = Student.create(student_params)
        if @student
            redirect_to(student_path(@student))
        else
            render('new')
        end
    end

    def show
        @student = find_item
    end

    def edit
        @student = find_item
    end

    def update
        @student = find_item
        if @student.update_attributes(student_params)
            redirect_to(student_path(@student))
        else
            render('edit')
        end
    end

    private
        def student_params
            params.require(:student).permit(:first_name, :last_name)
        end

        def find_item
            Student.find_by(id: params[:id])
        end

end
