class DataProjectTest < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :name
      t.integer :city_list, default: 0
      t.timestamps
    end

  	create_table :industries do |f|
  		f.string :title
  		f.integer :position, default: 1000
      f.references :city
  		f.timestamps
  	end

  	create_table :jobs do |f|
  		f.string :name
  		f.float :price
  		f.string :photo
  		f.text :description
      f.string :company
  		f.references :industry
  		f.timestamps
  	end
  end
end
