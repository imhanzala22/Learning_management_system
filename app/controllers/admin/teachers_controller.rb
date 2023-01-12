class Admin::TeachersController < ApplicationController
	TEACHERS_PER_PAGE = 9

	def index
		@page = params.fetch(:page,0).to_i
		@teachers = Teacher.offset(@page * TEACHERS_PER_PAGE).limit(TEACHERS_PER_PAGE)
	end

	def new
		@teacher = Teacher.new
	end

	def create
		@teacher = Teacher.new(teacher_params)
		debugger
		courses = params[:course_ids].map {|x| x.to_i} 
		debugger
        @teacher.course_ids = courses
		if @teacher.save
			UserMailer.teacher_welcome_email(@teacher).deliver
			redirect_to admin_teachers_path
		else
			render :new
		end
	end

	def show
		@teacher = Teacher.find(params[:id])
	end
	
	def edit
		@teacher = Teacher.find(params[:id])
	end

	def update
		@teacher = Teacher.find(params[:id])
		courses = params[:course_ids].map {|x| x.to_i} 
        @teacher.course_ids = courses
		if @teacher.update(teacher_params)
			redirect_to admin_teachers_path
		else
			render :edit, status: :unprocessable_entity
		end
	end

	def destroy
		@teacher = Teacher.find(params[:id])
		@teacher.destroy

		redirect_to admin_teachers_path, status: :see_other
	end

	def search
		if params[:search].blank?
		  redirect_to admin_teachers_path and return
		else
		  @parameter = params[:search].downcase
		  @results = Teacher.all.where("lower(first_name) LIKE :search OR lower(last_name) LIKE :search OR lower(email) LIKE :search", search: "%#{@parameter}%")
		end
	end

	protected

	def teacher_params
		params.require(:teacher).permit(:email, :password, :first_name, :last_name, :Date_of_Birth)
	end
end
