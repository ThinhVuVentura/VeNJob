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
      def delete(query, with_commit = true)
        self.solr_connection.delete_by_query query
        self.solr_connection.commit if with_commit
      end

      # commitする
      def commit(with_commit = true)
        self.solr_connection.commit
      end

      # optimizeする
      def optimize
        self.solr_connection.optimize
      end

      # 複数件のアイテムを追加する
      def bulk_add(items)
        self.solr_connection.add(items)
      end
    end

    # Solrへリクエストする為のハッシュを生成する
    def to_hash
      self.class.fields.each_with_object({}) do |field, hash|
        value = self.send(field)
        hash[field] = case value
                      when Time
                        value.to_s(:solr)
                      when String
                        # solrがエラーになるので、コントロール文字列の削除
                        value.gsub(/[[:cntrl:]]/, '')
                      else
                        value
                      end
      end
    end

    # save data to solr
    # flag with_commit for solr commit
    def save(with_commit = true)
      self.class.solr_connection.add(self.to_hash)
      self.class.commit if with_commit
    end

    def logger
      self.class.logger
    end
  end
end