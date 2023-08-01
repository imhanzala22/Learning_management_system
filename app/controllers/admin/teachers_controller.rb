class Admin::TeachersController < Admin::AdminAuthenticateController
	before_action :find_teacher, only: %i[edit update destroy show]

	def index
		@teachers= Teacher.all
		respond_to do |format|
			format.turbo_stream{
			  render turbo_stream: turbo_stream.update('main', template: 'admin/teachers/index')
			}
		  end
	end

	def new
		@teacher = Teacher.new
	end

	def create
		@teacher = Teacher.new(teacher_params)
		if params[:course_ids]
			courses = params[:course_ids].map {|x| x.to_i}
        @teacher.course_ids = courses
	    else 
		    flash[:notice] = "no course available"
			render :new and return
		end
		if @teacher.save
			flash[:notice] = "A new teacher is added"
			UserMailer.teacher_welcome_email(@teacher).deliver
			redirect_to admin_teachers_path
		else
			flash[:alert] = "Can't create, try again"
			render :new
		end
	end

	def show
		
	end
	
	def edit
	end

	def update
		courses = params[:course_ids]&.map {|x| x.to_i} 
        @teacher.course_ids = courses
		if @teacher.update(teacher_params)
			flash[:notice] = "teacher is updated"
			redirect_to admin_teachers_path
		else
			flash[:alert] = "Can't updated, Try again "
			render :edit, status: :unprocessable_entity
		end
	end

	def destroy
		if @teacher.destroy
			flash[:notice] = "teacher deleted"
			redirect_to admin_teachers_path, status: :see_other
		else
			flash[:alert] = "Can't delete, Try Again"
			redirect_to admin_courses_path
		end

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
	def find_teacher
		@teacher = Teacher.find(params[:id])
	end
end
