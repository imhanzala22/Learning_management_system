class Admin::StudentsController < Admin::AdminAuthenticateController
before_action :find_student, only: %i[edit update destroy show]
  def index
    @students = Student.all
    respond_to do |format|
      format.turbo_stream{
        render turbo_stream: turbo_stream.update('main', template: 'admin/students/index')
      }
    end
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    @student.enroll_year, @student.semester_type, @student.semester_no = params[:enroll_year], params[:semester_type], params[:semester_no]
    if @student.save 
      UserMailer.student_welcome_email(@student).deliver
      flash[:notice] = "Student created and email is sent" 
      redirect_to admin_students_path
    else
      render :new
      flash[:alert] = "Can't create Student, try Again later "
    end
  end

  def show
  end

  def edit
  end

  def update
    @student.enroll_year, @student.semester_type, @student.semester_no = params[:enroll_year], params[:semester_type], params[:semester_no]
    if @student.update(student_params)
      flash[:notice] = "Student is updated"
      redirect_to @student
    else
      flash[:alert] = "Can't update, Try again"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @student.destroy
    redirect_to admin_students_path, status: :see_other
    flash[:notice] = "Student Destroyed"  
    else
      flash[:alert] = "Can' delete, Try again"
      redirect_to admin_courses_path
    end
  end

  def dashboard
  end

  def search
    if params[:search].blank?
      redirect_to admin_students_path and return
    else
      @parameter = params[:search].downcase
      @results = Student.all.where("lower(first_name) LIKE :search OR lower(last_name) LIKE :search OR lower(email) LIKE :search", search: "%#{@parameter}%")
    end
  end

  protected

  def student_params
      params.require(:student).permit(:email, :password, :first_name, :last_name, :Date_of_Birth, :section, :roll_no, :semester)
  end
  def find_student
    @student = Student.find(params[:id])
  end
end
