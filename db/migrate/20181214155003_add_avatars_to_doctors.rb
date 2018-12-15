class AddAvatarsToDoctors < ActiveRecord::Migration[5.1]
  def up
    add_attachment :doctors, :avatar
  end

  def down
    remove_attachment :doctors, :avatar
  end
end
