class Donation < ActiveRecord::Base
  attr_accessible :customer_id, :campaign_id, :donor_id, :is_paid

  validates :customer_id, presence: true
  validates :campaign_id, presence: true
  validates :donor_id, presence: true

  belongs_to :campaign
  belongs_to :donor

  # need to add some sort of DateTime param here.. also move
  # this to the campaign class? -- they are making the money
  # create a service object between the campaign and donations
  def self.customer_id_list
    where("is_paid = ?", false)
  end

  # private
  # may want to move this to campaign....
  def self.charge_cards
    Stripe.api_key = 'sk_test_Zt4bmu85NOFARlheHQNgxD2f'

    customer_id_list.each { |d|
      c = Stripe::Customer.retrieve(d.customer_id)
      charge = Stripe::Charge.create(
        :amount => c.account_balance,
        :currency => "usd",
        :customer => c
      )
      d.update_attributes(:is_paid => true) if charge
    } 
  end
end
