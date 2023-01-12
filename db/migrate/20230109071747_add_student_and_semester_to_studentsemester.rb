class AddStudentAndSemesterToStudentsemester < ActiveRecord::Migration[7.0]
  def change
    add_reference :student_semesters, :student, index: true
    add_reference :student_semesters, :semester, index: true
  end
end
