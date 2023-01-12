class Enrollment < ApplicationRecord
  belongs_to :section
  belongs_to :student
  belongs_to :semester
  belongs_to :grade
end
