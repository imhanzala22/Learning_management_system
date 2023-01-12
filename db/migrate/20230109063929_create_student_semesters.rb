class CreateStudentSemesters < ActiveRecord::Migration[7.0]
  def change
    create_table :student_semesters do |t|

      t.belongs_to :student
      t.belongs_to :semester
      t.string :enroll_year
      t.timestamps
    end
  end
end
