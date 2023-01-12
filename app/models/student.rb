class Student < ApplicationRecord
  
  has_many :student_semesters
  has_many :semesters, :through => :student_semesters
  has_many :enrollments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
