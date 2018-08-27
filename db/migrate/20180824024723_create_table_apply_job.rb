class CreateTableApplyJob < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs_users do |t|
    	t.references :user
    	t.references :job
    	t.timestamps
    end
  end
end
