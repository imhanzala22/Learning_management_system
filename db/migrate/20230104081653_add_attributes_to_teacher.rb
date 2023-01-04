class AddAttributesToTeacher < ActiveRecord::Migration[7.0]
  def change
    add_column :teachers, :first_name, :string 
    add_column :teachers, :last_name, :string 
    add_column :teachers, :Date_of_Birth, :date 
  end
end
