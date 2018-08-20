class DataProjectTest < ActiveRecord::Migration[5.2]
  def change
  	create_table :categories do |f|
  		f.string :title
  		f.integer :position
  		f.timestamps
  	end

  	create_table :products do |f|
  		f.string :name
  		f.float :price
  		f.string :photo
  		f.text :description
  		f.references :category
  		f.timestamps
  	end
  end
end
