class CreateSemesters < ActiveRecord::Migration[7.0]
  def change
    create_table :semesters do |t|

      t.string :semester_type
      t.integer :semester_no

      t.timestamps
    end
  end
end
