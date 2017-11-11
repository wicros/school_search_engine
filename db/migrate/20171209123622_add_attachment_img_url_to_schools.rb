class AddAttachmentImgUrlToSchools < ActiveRecord::Migration::Current
  def self.up
    change_table :schools do |t|
      t.attachment :img_url
    end
  end

  def self.down
    remove_attachment :schools, :img_url
  end
end
