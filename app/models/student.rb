class Student < ApplicationRecord
  attr_accessor :enroll_year, :semester_no, :semester_type
  after_create :semester_enrollment
  after_update :semester_enrollment
  has_many :student_semesters
  has_many :semesters, :through => :student_semesters
  has_many :enrollments
  has_one_attached :image, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   PASSWORD_FORMAT = /\A(?=.{8,})(?=.*[A-Z])(?=.*[[:^alnum:]])/x.freeze

  validates :password, presence: true,
      format: { with: PASSWORD_FORMAT}, confirmation: true,
      format: { with: PASSWORD_FORMAT}

  validates :first_name, :last_name, :Date_of_Birth, :roll_no, presence: true

  private
   def semester_enrollment
    semester = Semester.where(semester_type: self.semester_type, semester_no: self.semester_no).ids[0]
    if self.semester[-1].id = semester_id
      return
    else
     self.student_semesters.create(semester_id: semester, enroll_year: self.enroll_year)
    end
   end
end
