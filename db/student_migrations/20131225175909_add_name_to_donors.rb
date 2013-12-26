class AddNameToDonors < ActiveRecord::Migration
  def change
    add_column :donors, :firstname, :string
    add_column :donors, :lastname, :string
  end
end
