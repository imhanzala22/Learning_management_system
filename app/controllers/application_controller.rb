# require 'student_parameter_sanitizer'
# require 'teacher_parameter_sanitizer'

class ApplicationController < ActionController::Base
    # def after_sign_in_path_for(resource)
    #     # redirect_to destroy_student_session_path and return if student_signed_in?
    #     debugger
    #     sign_out(resource) if student_signed_in?
          
    #     redirect_to stored_location_for(resource) || admin_students_dashboard_url and return if resource.is_a? Student
    # end
  
    protected

    def after_sign_in_path_for(resource)
      if resource_class == Student
        redirect_to student_dashboard_index_path
      elsif resource_class == Teacher
        redirect_to admin_teachers_dashboard_path
      else
        admin_session_index_path
      end
    end
end
