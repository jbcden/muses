class DonationsController < ApplicationController
  def donate
    @campaign_id = params[:campaign_id] 
  end

  def payment
    Stripe.api_key = 'sk_test_Zt4bmu85NOFARlheHQNgxD2f'
    campaign_id = params[:campaign_id]
    token = params[:stripe_card_token]
    amount = (params[:amount].to_i * 100)
    if token
      customer = Stripe::Customer.create(
        :card => token,
        :account_balance => amount
      )
      # save_stripe_customer_id(@campaign_id, current_donor.id, customer_id)
      save_stripe_customer_id(campaign_id, 2, customer.id)
    end
  end

  private
  def save_stripe_customer_id(campaign, donor, customer_id)
    d = Donation.create(customer_id: customer_id, campaign_id: campaign, donor_id: donor)
    if d.save!
      flash[:success] = "Thank you for contributing!"
      redirect_to campaign_path(campaign)
      # render 'donate'
    else
      flash[:notice] = "All fields are required"
      render 'donate'
    end
  end
end
