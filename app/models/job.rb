class Job < ApplicationRecord
	acts_as_favoritable
	belongs_to :industry
	mount_uploader :photo, PhotoUploader
	validates :name, :price, :description,:company, :photo, :industry_id,  presence: true
	validates :price, numericality: { :greater_than_or_equal_to => 0 }
	has_and_belongs_to_many :users, :dependent => :delete_all

	def self.search(search_parameter)
		search = Solr::Searcher::Base.search(search_parameter)
		search
	end
end