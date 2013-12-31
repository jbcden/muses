class Campaign < ActiveRecord::Base
  attr_accessible :profile_picture, :firstname, :lastname, :preferred_name, :state, :city, :instrument, :target_amount, :age, :bio, :student_id, :title, :description
  has_attached_file :profile_picture, :styles => { :medium => "150x150>", :thumb => "60x60>" }
  validates :profile_picture, :attachment_presence => true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :state, presence: true
  validates :city, presence: true
  validates :instrument, presence: true
  validates :target_amount, presence: true
  validates :age, presence: true
  validates :bio, presence: true
  validates_uniqueness_of :firstname, :scope => :lastname
  validates :title, :presence => true
  validates :description, :presence => true

  belongs_to :student, :foreign_key => :student_id
end
