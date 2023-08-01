class Teacher < ApplicationRecord

  has_many :sections
  has_and_belongs_to_many :courses, join_table: "expertises"
  has_one_attached :image, dependent: :destroy 
#   validates :photos, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..(5.megabytes) }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_FORMAT = /\A(?=.{8,})(?=.*[A-Z])(?=.*[[:^alnum:]])/x.freeze

         validates :password, presence: true,
         format: { with: PASSWORD_FORMAT}, confirmation: true,
         format: { with: PASSWORD_FORMAT}
   
     validates :first_name, :last_name, :Date_of_Birth, presence: true
end
