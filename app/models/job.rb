class Job < ApplicationRecord
	acts_as_favoritable
	belongs_to :category
	mount_uploader :photo, PhotoUploader
	validates :name, :price, :description, :photo, :category_id,  presence: true
	validates :price, numericality: { :greater_than_or_equal_to => 0 }
	has_and_belongs_to_many :users, :dependent => :delete_all

	searchable do
    text :name, default_boost: 2
  end
end