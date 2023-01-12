class Course < ApplicationRecord
    has_many :sections
    has_and_belongs_to_many :teachers , join_table: "expertises"
end
