class RenameTableProductToJob < ActiveRecord::Migration[5.2]
  def change
  	rename_table :products, :jobs
  end
end
