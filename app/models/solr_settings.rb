class SolrSettings < Settingslogic
  source "#{Rails.root}/config/solr/settings.yml"
  namespace Rails.env
end
