class AddDefaultProgressToCampaigns < ActiveRecord::Migration
  def change
    change_column :campaigns, :progress, :integer, default: 0
  end
end
