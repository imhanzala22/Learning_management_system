class AddReferencesToSection < ActiveRecord::Migration[7.0]
  def change
    add_reference :sections, :semester, index: true
    add_reference :sections, :teacher, index: true
    add_reference :sections, :course, index: true
  end
end
