class AddConfirmableToUsers < ActiveRecord::Migration
  def self.up
    add_column :students, :confirmation_token, :string
    add_column :students, :confirmed_at, :datetime
    add_column :students, :confirmation_sent_at, :datetime
    add_index :students, :confirmation_token, :unique => true

    User.update_all(:confirmed_at => Time.now)
  end
  def self.down
    remove_columns :students, :confirmation_token, :confirmed_at, :confirmation_sent_at
  end
end
