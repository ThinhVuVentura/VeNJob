class Job < ApplicationRecord
	after_save :updata_solr
	after_update :update_data_solr
	before_destroy :del_data_solr
	acts_as_favoritable

	belongs_to :industry
	belongs_to :city
	mount_uploader :photo, PhotoUploader
	has_and_belongs_to_many :users, :dependent => :delete_all

	def self.search(args={})
		if args[:key].present?
			jobs=[]
			solr = Solr::Base.solr_connection
			response = solr.get 'select', :params => {:q=>"salary:#{args[:key].downcase.gsub(/^\(+|\)+$/, '').gsub(/-/, ' ').gsub('.', '')}", :start => 0 , :rows => 30}
			response["response"]["docs"].each{|doc| jobs << Job.find(doc["id"].to_i) }
		else
			jobs = all
		end
		jobs
	end

	private
		def updata_solr
			solr = Solr::Base.solr_connection
			solr.add :id => Job.last.id, :salary => self.price.downcase.gsub(/^\(+|\)+$/, '').gsub(/-/, ' ').gsub('.', '') if self.price.present?
			solr.commit
		end

		def update_data_solr
			solr = Solr::Base.solr_connection
			solr.delete_by_id [self.id]
			solr.add :id => self.id, :salary => self.price.downcase.gsub(/^\(+|\)+$/, '').gsub(/-/, ' ').gsub('.', '') if self.price.present?
			solr.commit
		end

		def del_data_solr
			solr = Solr::Base.solr_connection
			solr.delete_by_id [self.id]
		end
end