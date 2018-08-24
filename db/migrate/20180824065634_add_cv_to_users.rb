class AddCvToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :cv, :string
  end
end
