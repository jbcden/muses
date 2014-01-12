class CreateStudentsTable < ActiveRecord::Migration
  def up
    create_table :students
  end

  def down
    drop_table :students
  end
end
