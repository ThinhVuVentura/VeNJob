class Industry < ApplicationRecord
	has_many :jobs, :dependent => :delete_all
	validates :title, presence: true
end