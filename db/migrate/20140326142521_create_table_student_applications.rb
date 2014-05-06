class CreateTableStudentApplications < ActiveRecord::Migration
  def up
    create_table :student_applications do |t|
      t.string :who
      t.string :s_last
      t.string :s_middle
      t.string :s_first
      t.string :s_nickname
      t.string :s_gender
      t.string :s_grade
      t.string :s_school
      t.string :s_school
      t.string :school_city
      t.string :s_age
      t.date   :dob
      t.string :g1_last
      t.string :g1_middle
      t.string :g1_first
      t.string :g1_relation
      t.string :g1_occupation
      t.string :g1_edu
      t.string :g2_last
      t.string :g2_middle
      t.string :g2_first
      t.string :g2_relation
      t.string :g2_occupation
      t.string :g2_edu
      t.string :primary_addr
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone1
      t.string :phone2
      t.string :email
      t.string :circumstances
      t.string :household_income
      t.string :amount_debt
      t.string :amount_savings
      t.string :amount_assets
      t.attachment :financial_doc
      t.text :s_about
      t.text :s_living
      t.text :s_proj_description
      t.text :s_important
      t.text :s_favorite_part
      t.text :s_tell_donors
      t.attachment :s_picture
      t.attachment :g_picture
      t.string :disciplinary
      t.string :g_convicted
      t.text :gc_description
      t.string :conf_name
      t.string :conf_relation
      t.string :conf_full
      t.date :conf_date
    end
  end

  def down
    drop_table :student_applications
  end
end
