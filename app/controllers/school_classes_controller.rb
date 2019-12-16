class SchoolClassesController < ApplicationController

    def index
        @school_classes = SchoolClass.all
    end
    
    def new
        @school_class = SchoolClass.new
        render :form
    end

    def create
        @school_class = SchoolClass.new(sc_params)
        @school_class.save
        redirect_to school_class_path(@school_class)
    end

    def show
        @school_class = SchoolClass.find(params[:id])
    end

    def edit
        @school_class = SchoolClass.find(params[:id])
        render :form
    end

    def update
        @school_class = SchoolClass.find(params[:id])
        @school_class.update(sc_params)
        redirect_to school_class_path(@school_class)
    end

    private

    def sc_params
        params.require(:school_class).permit(:title, :room_number)
    end
end