class AddStudentIdToStudentApplication < ActiveRecord::Migration
  def change
    add_column :student_applications, :student_id, :integer
  end
end
