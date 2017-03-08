class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.string :name
      t.string :description
	  t.references :documentable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
