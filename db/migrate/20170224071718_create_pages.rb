class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.string :short_name
      t.boolean :is_public?, default: false
      t.timestamps
    end
  end
end
