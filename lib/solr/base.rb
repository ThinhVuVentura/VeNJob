require 'rsolr'
require 'rsolr-ext'
require 'kconv'

module Solr
  class Base
    class << self
      def logger
        @logger ||= Logger.new(SolrSettings.logger.path, 'daily')
      end

      # solrのcore名
      def core_name
        'object_core'
      end

      # solrの設定
      def solr_setting
        SolrSettings.send(self.core_name)
      end

      # solrの設定
      # 子クラス単位でコネクションを保持する
      def solr_connection
        @solr_connection ||= RSolr::Ext.connect(
          url: self.solr_setting.url,
          update_format: :json,
          open_timeout: SolrSettings.connection.open_timeout,
          read_timeout: SolrSettings.connection.read_timeout,
          retry_503: SolrSettings.connection.retry_503)
      end

      # 全件削除
      def delete_all!
        self.solr_connection.delete_by_query '*:*'
        self.solr_connection.commit
      end

      # 条件に従ってsolrからアイテムを削除

      # 複数件のアイテムを追加する
    end
  end
end