class ChangeCustomerIdDonation < ActiveRecord::Migration
  def up
    change_column :donations, :customer_id, :string
  end

  def down
  end
end
