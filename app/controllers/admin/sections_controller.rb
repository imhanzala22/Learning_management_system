class Admin::SectionsController < ApplicationController

	def index
		@sections = Section.all
	end
	
	def new
		@section = Section.new
	end

	def create
		@section = Section.new(section_params)
		if @section.save
			redirect_to admin_sections_path
		else
			render :new, status: :unprocessable_entity
		end
	end

	def edit
		@section = Section.find(params[:id])
	end

	def update
		@section = Section.find(params[:id])
		if @section.update(section_params)
			redirect_to admin_sections_path
		else
			render :edit, status: :unprocessable_entity
		end
	end

	def destroy
		@section = Section.find(params[:id])
		@section.destroy
		redirect_to admin_sections_path, status: :see_other
	end

	private
	def section_params
		params.require(:section).permit(:course_id,:teacher_id,:semester_id,:section_name)
	end
end
