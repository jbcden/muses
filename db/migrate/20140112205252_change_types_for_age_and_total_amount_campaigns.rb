class ChangeTypesForAgeAndTotalAmountCampaigns < ActiveRecord::Migration
  def up
    change_column :campaigns, :age, :string
    change_column :campaigns, :target_amount, :string
  end

  def down
  end
end
