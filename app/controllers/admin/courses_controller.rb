class Admin::CoursesController < Admin::AdminAuthenticateController
 before_action :find_course, only: %i[edit destroy update show]
  def index
    @courses = Course.all
    respond_to do |format|
      format.turbo_stream{
        render turbo_stream: turbo_stream.update('main', template: 'admin/courses/index')
      }
    end
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to admin_courses_path
      flash[:notice] = "A new course has been added to the courses."
    else
      render :new
      flash[:new] = "Failed to create new course"
    end
  end

  def show
    
  end
  
  def edit
    
  end

  def update 
    if @course.update(course_params)
      redirect_to admin_courses_path
      flash[:notice]= "Your course has been updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @course.destroy
    redirect_to admin_courses_path, status: :see_other
    else
    flash[:flash]= "Can't delete,Unseccessfull"
    redirect_to admin_courses_path
    end
  end

  def search
    if params[:search].blank?
      redirect_to admin_courses_path and return
    else
      @parameter = params[:search].downcase
      @results = Course.all.where("lower(course_title) LIKE :search OR lower(course_code) LIKE :search", search: "%#{@parameter}%")
    end
  end
  
  protected

  def course_params
    params.require(:course).permit(:course_title, :course_code)
  end
  def find_course
    @course = Course.find(params[:id])
  end
end
