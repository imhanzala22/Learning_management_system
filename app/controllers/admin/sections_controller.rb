class Admin::SectionsController < Admin::AdminAuthenticateController
	before_action :find_section, only: %i[update destroy edit] 
	def index
		@sections = Section.all
		respond_to do |format|
			format.turbo_stream{
			  render turbo_stream: turbo_stream.update('main', template: 'admin/sections/index')
			}
		  end
	end
	
	def new
		@section = Section.new
	end

	def create
		@section = Section.new(section_params)
		if @section.save
			redirect_to admin_sections_path
			flash[:notice] = "A new Section is added"
		else
			render :new, status: :unprocessable_entity
			flash[:alert] = "sorry, unable to add section"
		end
	end

	def edit
		
	end

	def update
		if @section.update(section_params)
			redirect_to admin_sections_path
			flash[:notice] = "Section is updated"
		else
			render :edit, status: :unprocessable_entity
			flash[:alert] = "Can't update this section"
		end
	end

	def destroy
		if @section.destroy
			flash[:notice] = "Section is deleted"
			redirect_to admin_sections_path, status: :see_other
	    else
			flash[:alert] = "Can't destroy, Try later"
			redirect_to admin_courses_path
		end
	end

	private
	def section_params
		params.require(:section).permit(:course_id,:teacher_id,:semester_id,:section_name)
	end
	def find_section
		@section = Section.find(params[:id])
	end
end
