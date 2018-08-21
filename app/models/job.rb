class Job < ApplicationRecord
	belongs_to :category
	mount_uploader :photo, PhotoUploader
	validates :name, :price, :description, :photo, :category_id,  presence: true
	validates :price, numericality: { :greater_than_or_equal_to => 0 }
end