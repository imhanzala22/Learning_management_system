class Student::DashboardController < Student::StudentAuthenticateController
    before_action :authenticate_student!
    def index
    end

    def edit
        @student = Student.find(params[:id])
    end

    def update
        @student = Student.find(params[:id])
        @student.semester_type = params[:semester_type]
        @student.semester_no = params[:semester_no]
        @student.enroll_year = params[:enroll_year]
        if @student.update(profile_params)
            sign_in @student, bypass: true
            redirect_to student_dashboard_index_path
        else
            flash[:notice] = "You can not update"
            render :edit
        end
    end
    
    def enrollments
        @enrollments = current_student.semesters[-1].enrollments.where(grade_id:1, student_id: current_student.id)
    end

    def student_history
        @semesters = current_student.semesters
    end

    private
     
    def profile_params
        params.require(:student).permit(:first_name, :last_name, :Date_of_Birth, :email, :password, :image)
    end
end
