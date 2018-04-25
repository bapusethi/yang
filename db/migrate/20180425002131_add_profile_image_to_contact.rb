class AddProfileImageToContact < ActiveRecord::Migration[5.1]
  def change
    add_attachment :contacts, :profile_image
  end
end
