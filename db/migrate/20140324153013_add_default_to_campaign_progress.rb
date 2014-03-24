class AddDefaultToCampaignProgress < ActiveRecord::Migration
  def up
    change_column :campaigns, :progress, :integer, :default => 0
  end
end
