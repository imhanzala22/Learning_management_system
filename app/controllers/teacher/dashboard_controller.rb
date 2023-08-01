class Teacher::DashboardController < Teacher::TeacherAuthenticateController
   
    def index;
    end

    def show;
     @teacher = Teacher.find(params[:id])
    end

    def edit
      @teacher = Teacher.find(params[:id])
    end

    def update
      @teacher = Teacher.find(params[:id])
      if @teacher.update(teacher_profile)
          sign_in @teacher, bypass: true
        redirect_to teacher_dashboard_index_path
      else
        flash[:notice] = "You can not update, Try late"
        render edit
      end
    end

    def course
        @courses = current_teacher.sections
    end

    def section
        @sections = current_teacher.sections
    end
  
    private 
    
    def teacher_profile
      params.require(:teacher).permit(:first_name, :last_name, :Date_of_Birth, :email, :password, :image)
    end
end
