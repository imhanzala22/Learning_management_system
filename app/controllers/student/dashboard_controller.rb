class Student::DashboardController < ApplicationController
    before_action :authenticate_student!
    def index
    end
    
    def enrollments
        @enrollments = current_student.semesters[-1].enrollments.where(grade_id:1, student_id: current_student.id)
    end

    def student_history
        @semesters = current_student.semesters
    end
end
