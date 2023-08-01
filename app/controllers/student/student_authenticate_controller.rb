class Student::StudentAuthenticateController < ApplicationController
    before_action :authenticate_student!

    layout 'student'
end
