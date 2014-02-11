class Donor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :profile_picture, :email, :password, :password_confirmation, :remember_me, :lastname, :firstname
  has_attached_file :profile_picture, :styles => {:medium => "150x150>", :thumb => "60x60>" }
  validates :profile_picture, :attachment_presence => true

  has_many :donations
end
