class Admin::EnrollmentsController < ApplicationController
	def index
		@enrollments = Enrollment.all
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
		else
			render :new
		end
	end
	def edit
		@enrollment = Enrollment.find(params[:id])
	end

	def update
		semester_id = Student.find_by(id:params[:enrollment][:student_id].to_i).semesters[0].id
		@enrollment = Enrollment.new(enrollment_params)
		@enrollment.semester_id=semester_id
		if @enrollment.update(enrollment_params)
			redirect_to admin_enrollments_path
		else
			render :edit, status: :unprocessable_entity
		end
	end

	def destroy
		@enrollment = Enrollment.find(params[:id])
		@enrollment.destroy
		redirect_to admin_enrollments_path, status: :see_other
	end

	private
	
	def enrollment_params
		params.require(:enrollment).permit(:student_id,:section_id,:grade_id)
	end
end
