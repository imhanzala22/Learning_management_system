class Teacher::DashboardController < ApplicationController
    before_action :authenticate_teacher!

    def index; end
    def course
        @courses = current_teacher.sections
    end

    def section
        @sections = current_teacher.sections
    end
    
end
