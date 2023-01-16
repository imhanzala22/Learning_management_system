class Admin::StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      semester_id=Semester.where(semester_type:params[:semester_type],semester_no:params[:semester_no]).ids[0]
      @student.student_semesters.create(semester_id:semester_id,enroll_year:params[:enroll_year])
      UserMailer.student_welcome_email(@student).deliver
      redirect_to admin_students_path
    else
      render :new
    end
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      semester_id=Semester.where(semester_type:params[:semester_type],semester_no:params[:semester_no]).ids[0]
      @student.student_semesters.create(semester_id:semester_id,enroll_year:params[:enroll_year])
      redirect_to @student
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    redirect_to admin_students_path, status: :see_other
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
end
