class AddTargetDateToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :target_date, :date
  end
end
