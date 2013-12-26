class CreateCampaigns < ActiveRecord::Migration
  def up
    create_table :campaigns do |t|
      t.attachment :profile_picture
      t.string :firstname
      t.string :lastname
      t.string :preferred_name, :null => true
      t.string :state
      t.string :city
      t.string :instrument
      t.integer :target_amount
      t.integer :age
      t.string :bio
    end
  end

  def down
    drop_table :campaigns
  end
end
