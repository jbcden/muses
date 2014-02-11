class Donation < ActiveRecord::Base
  attr_accessible :customer_id, :campaign_id, :donor_id

  validates :customer_id, presence: true
  validates :campaign_id, presence: true
  validates :donor_id, presence: true

  belongs_to :campaign
  belongs_to :donor
end
