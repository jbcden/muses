class CreateDonationBelongsTos < ActiveRecord::Migration
  def up
    create_table :donations do |t|
      t.belongs_to :campaign
      t.belongs_to :donor
      t.timestamps
    end
  end

  def down
    drop_table :donations
  end
end
