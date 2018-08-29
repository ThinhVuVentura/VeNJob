class Industry < ApplicationRecord
	has_many :jobs, :dependent => :delete_all
	belongs_to :city
	validates :title, :position, presence: true, uniqueness: true
	validates :position, :numericality => { :greater_than_or_equal_to => 0 }
end