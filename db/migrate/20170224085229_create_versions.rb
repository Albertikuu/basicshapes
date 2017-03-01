class CreateVersions < ActiveRecord::Migration[5.0]
  def change
    create_table :versions do |t|
    	t.string :title
    	t.string :description
    	t.string :content
    	t.integer :page_id
    	t.integer :user_id

      t.timestamps
    end
  end
end
