class AddDescriptionAndProgressToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :description, :string
    add_column :campaigns, :title, :string
    add_column :campaigns, :progress, :integer
  end
end
