class AddProfilePictureToDonors < ActiveRecord::Migration
  def change
    change_table :donors do |t|
      t.attachment :profile_picture
    end
  end
end
