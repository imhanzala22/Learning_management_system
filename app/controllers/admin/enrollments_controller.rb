class Admin::EnrollmentsController < Admin::AdminAuthenticateController
	before_action :find_course, only: %i[edit destroy update]
	def index
		@enrollments = Enrollment.all
		respond_to do |format|
			format.turbo_stream{
			  render turbo_stream: turbo_stream.update('main', template: 'admin/enrollments/index')
			}
		  end
	end
	def new
		@enrollment = Enrollment.new
	end
	def create
		semester_id = Student.find_by(id:params[:enrollment][:student_id].to_i).semesters[0].id
		@enrollment = Enrollment.new(enrollment_params)
		@enrollment.semester_id=semester_id
		if @enrollment.save
			redirect_to admin_enrollments_path
			flash[:notice] = "A new Student is Enrolled"
		else
			render :new
			flash[:alert] = "Sorry you can't add Enrollment, try later"
		end
	end
	def edit
		
	end

	def update
		semester_id = Student.find_by(id:params[:enrollment][:student_id].to_i).semesters[0].id
		@enrollment.semester_id = semester_id
		if @enrollment.update(enrollment_params)
			redirect_to admin_enrollments_path
			flash[:notice] = "Enrollement is updated" 
		else
			render :edit, status: :unprocessable_entity
			flash[:alert] = "Sorry Enrollemnt Rollbacked"
		end
	end

	def destroy
		if @enrollment.destroy
		redirect_to admin_enrollments_path, status: :see_other
		else
		flash[:alert] = "Unable to process this action"
		redirect_to admin_courses_path
		end
	end

	private
	
	def enrollment_params
		params.require(:enrollment).permit(:student_id,:section_id,:grade_id)
	end
	def find_enrollment
		@enrollment = Enrollment.find(params[:id])
	end
end
