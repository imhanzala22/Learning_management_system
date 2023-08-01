class Section < ApplicationRecord
    has_many :enrollments
    belongs_to :teacher
    belongs_to :semester
    belongs_to :course

    validates :section_name, presence: true
end
