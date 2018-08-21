class Category < ApplicationRecord
	has_many :jobs
	validates :title, :position, presence: true, uniqueness: true
	validates :position, :numericality => { :greater_than_or_equal_to => 0 }
end