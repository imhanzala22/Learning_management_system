class AddGradeReferencesToEnrollments < ActiveRecord::Migration[7.0]
  def change
    add_reference :enrollments, :grade, null: true, foreign_key: false, default: 1
    Enrollment.where(grade_id: nil).update_all(grade_id: 1)
  end
end
