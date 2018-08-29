class Job < ApplicationRecord
	acts_as_favoritable
	belongs_to :industry
	belongs_to :city
	mount_uploader :photo, PhotoUploader
	has_and_belongs_to_many :users, :dependent => :delete_all

	def self.search(search_parameter)
		search = Solr::Searcher::Base.search(search_parameter)
		search
	end
end