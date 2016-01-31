class AddConfirmableToUsers < ActiveRecord::Migration
  def self.up
    create_table :students
    add_column :students, :confirmation_token, :string
    add_column :students, :confirmed_at, :datetime
    add_column :students, :confirmation_sent_at, :datetime
    add_index :students, :confirmation_token, :unique => true
  end
  def self.down
    drop_table :students
  end
end
