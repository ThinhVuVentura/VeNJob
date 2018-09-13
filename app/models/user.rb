class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  require 'csv'
  acts_as_favoritor
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_and_belongs_to_many :jobs , :dependent => :delete_all
  mount_uploader :cv, CvUploader
end