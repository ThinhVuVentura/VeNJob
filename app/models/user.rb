class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  acts_as_favoritor
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, :phone, :address,  presence: true
  has_and_belongs_to_many :jobs
  mount_uploader :cv, CvUploader
end