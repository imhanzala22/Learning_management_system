require 'student_parameter_sanitizer'
require 'teacher_parameter_sanitizer'

class ApplicationController < ActionController::Base
    before_action :authenticate_admin!

    protected

    def devise_parameter_sanitizer
      if resource_class == Student
        StudentParameterSanitizer.new(Student, :student, params)
      elsif resource_class == Teacher
        TeacherParameterSanitizer.new(Teacher, :teacher, params)
      else
        super # Use the default one
      end
    end
end
