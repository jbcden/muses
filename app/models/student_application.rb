class StudentApplication < ActiveRecord::Base

  belongs_to :student, :foreign_key => :student_id

  has_attached_file :financial_doc
  has_attached_file :s_picture, :styles => { medium: "150x150>", 
    thumb: "60x60>" }
  has_attached_file :g_picture, :styles => { medium: "150x150>", 
    thumb: "60x60>" }

  attr_accessible :who, :s_last, :s_middle, :s_first, :s_nickname,
     :s_gender, :s_grade, :s_school, :school_city, :s_age, :dob, 
     :g1_last, :g1_middle, :g1_first, :g1_relation, :g1_occupation,
     :g1_edu, :g2_last, :g2_middle, :g2_first, :g2_relation,
     :g2_occupation, :g2_edu, :primary_addr, :city, :state, :zip,
     :phone1, :phone2, :email, :circumstances, :household_income,
     :amount_debt, :amount_savings, :amount_assets, :financial_doc,
     :s_about, :s_living, :s_proj_description, :s_important,
     :s_favorite_part, :s_tell_donors, :s_picture, :g_picture,
     :disciplinary, :g_convicted, :gc_description, :conf_name,
     :conf_relation, :conf_full, :conf_date

  validates :financial_doc, :attachment_presence => true, :if => :page_two?
  validates :s_picture, :attachment_presence => true, :if => :page_three?
  validates :g_picture, :attachment_presence => true, :if => :page_three?
  validates :who, presence: true
  validates :s_last, presence: true, :if => :page_one?
  validates :s_middle, presence: true, :if => :page_one?
  validates :s_first, presence: true, :if => :page_one?
  validates :s_gender, presence: true, :if => :page_one?
  validates :s_grade, presence: true, :if => :page_one?
  validates :s_school, presence: true, :if => :page_one?
  validates :school_city, presence: true, :if => :page_one?
  validates :s_age, presence: true, :if => :page_one?
  validates :dob, presence: true, :if => :page_one?
  validates :g1_last, presence: true, :if => :page_one?
  validates :g1_middle, presence: true, :if => :page_one?
  validates :g1_first, presence: true, :if => :page_one?
  validates :g1_relation, presence: true, :if => :page_one?
  validates :g1_occupation, presence: true, :if => :page_one?
  validates :g1_edu, presence: true, :if => :page_one?
  validates :primary_addr, presence: true, :if => :page_one?
  validates :city, presence: true, :if => :page_one?
  validates :state, presence: true, :if => :page_one?
  validates :zip, presence: true, :if => :page_one?
  validates :phone1, presence: true, :if => :page_one?
  validates :phone1, format: {with: /\d{3}-\d{3}-\d{4}/, message: "Phone number in the incorrect format."}
  validates :email, presence: true, :if => :page_one?
  validates :email, format: {with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/, message: "Incorrect email format."}
  validates :circumstances, presence: true, :if => :page_two?
  validates :household_income, presence: true, :if => :page_two?
  validates :amount_debt, presence: true, :if => :page_two?
  validates :amount_savings, presence: true, :if => :page_two?
  validates :amount_assets, presence: true, :if => :page_two?
  validates :s_about, presence: true, :if => :page_three?
  validates :s_living, presence: true, :if => :page_three?
  validates :s_proj_description, presence: true, :if => :page_three?
  validates :s_important, presence: true, :if => :page_three?
  validates :s_favorite_part, presence: true, :if => :page_three?
  validates :s_tell_donors, presence: true, :if => :page_three?
  validates :disciplinary, presence: true, :if => :page_four?
  validates :g_convicted, presence: true, :if => :page_four?
  validates :gc_description, presence: true, :if => :page_four?
  validates :conf_name, presence: true, :if => :page_four?
  validates :conf_relation, presence: true, :if => :page_four?
  validates :conf_full, presence: true, :if => :page_four?
  validates :conf_date, presence: true, :if => :page_four?

  def page_one?
    !who.blank?
  end

  def page_two?
    !s_last.blank?
  end

  def page_three?
    !circumstances.blank?
  end

  def page_four?
    !s_about.blank?
  end
end

