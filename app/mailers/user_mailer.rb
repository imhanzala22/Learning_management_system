class UserMailer < ApplicationMailer
    default from: 'Amroodlab@lms.com'

    def student_welcome_email(student)
      @student = student
      mail(to: @student.email, subject: 'Welcome to My Awesome Site')
    end

    def teacher_welcome_email(teacher)
        @teacher = teacher
        mail(to: @teacher.email, subject: 'Welcome to My Awesome Site')
    end
end
