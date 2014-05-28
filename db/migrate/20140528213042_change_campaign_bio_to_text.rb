class ChangeCampaignBioToText < ActiveRecord::Migration
  def up
    change_column :campaigns, :bio, :text
  end

  def down
  end
end
