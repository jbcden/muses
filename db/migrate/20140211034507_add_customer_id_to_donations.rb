class AddCustomerIdToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :customer_id, :integer
  end
end
