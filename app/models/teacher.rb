class Teacher < ApplicationRecord

  has_many :sections
  has_and_belongs_to_many :courses, join_table: "expertises"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  paginates_per 5
end
