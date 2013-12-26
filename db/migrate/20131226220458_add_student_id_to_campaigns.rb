class AddStudentIdToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :student_id, :integer
  end
end
