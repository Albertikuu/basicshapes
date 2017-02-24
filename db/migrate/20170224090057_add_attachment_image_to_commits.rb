class AddAttachmentImageToCommits < ActiveRecord::Migration
  def self.up
    change_table :commits do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :commits, :image
  end
end
