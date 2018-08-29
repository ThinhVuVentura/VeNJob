class Solr::Searcher::Base < Solr::Base
  attr_accessor :solr_query

  class << self
    def search(search_parameter = nil, &block)
      solr = Solr::Base.solr_connection
      search = solr.get 'select', search_parameter
      return search
      # @solr_connection.get 'select', search_parameter
    end
  end

  # @solr_query is a instance of Solr::Query
  def initialize(solr_query)
    @solr_query = solr_query
  end
end