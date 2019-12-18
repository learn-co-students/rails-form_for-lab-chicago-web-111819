class SchoolClassesController < ApplicationController
    def new
        @school_class = SchoolClass.new
    end

    def create
        @school_class = SchoolClass.create(sch_class_params)
        if @school_class
            redirect_to(school_class_path(@school_class))
        else
            render('new')
        end
    end

    def show
        @school_class = find_item
    end

    def edit
        @school_class = find_item
    end

    def update
        @school_class = find_item
        if @school_class.update_attributes(sch_class_params)
            redirect_to(school_class_path(@school_class))
        else
            render('edit')
        end
    end

    private
        def sch_class_params
            params.require(:school_class).permit(:title, :room_number)
        end

        def find_item
            SchoolClass.find_by(id: params[:id])
        end

end


