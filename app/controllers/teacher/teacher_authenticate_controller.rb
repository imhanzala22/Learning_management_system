class Teacher::TeacherAuthenticateController < ApplicationController
    before_action :authenticate_teacher!
    layout 'teacher'
end