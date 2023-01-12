class AddAttributesToStudent < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :first_name, :string 
    add_column :students, :last_name, :string 
    add_column :students, :Date_of_Birth, :date
    add_column :students, :roll_no, :integer
  end
end
