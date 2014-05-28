class Campaign < ActiveRecord::Base
  attr_accessible :profile_picture, :firstname, :lastname, :preferred_name, :state, :city, :instrument, :target_amount, :age, :bio, :student_id, :title, :description, :progress
  has_attached_file :profile_picture,
   :storage => :s3,
   :styles => { :medium => "150x150>", :thumb => "60x60>" },
   :s3_credentials => Proc.new {S3.s3_credentials_test}
  validates :profile_picture, :attachment_presence => true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :state, presence: true
  validates :city, presence: true
  validates :instrument, presence: true
  validates :target_amount, presence: true
  validates :target_amount, :numericality => {:greater_than => 0}
  validates :age, presence: true
  validates :age, :numericality => {:greater_than => 0}
  validates :bio, presence: true
  validates_uniqueness_of :firstname, :scope => :lastname
  validates :title, :presence => true
  validates :description, :presence => true

  belongs_to :student, :foreign_key => :student_id
  has_many :donations, :dependent => :destroy

  def add_to_progress(amount)
    if self.progress == nil
      self.progress = amount
      self.save!
    else 
      self.progress += amount
      self.save!
    end
  end
end
