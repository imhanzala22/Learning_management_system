class Student::DashboardController < ApplicationController
    before_action :authenticate_student!
    def index
    end
    
    def enrollments
        @enrollments = current_student.enrollments
    end
end
