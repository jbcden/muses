class DonationsController < ApplicationController

  before_filter :is_donor, :only => [:donate, :payment]
  def donate
    @campaign_id = params[:campaign_id] 
  end

  def payment
    Stripe.api_key = 'sk_test_Zt4bmu85NOFARlheHQNgxD2f'
    campaign_id = params[:campaign_id]
    token = params[:stripe_card_token]
    amount = (params[:amount].to_i * 100) # do math here
    if token
      customer = Stripe::Customer.create(
        :card => token,
        :account_balance => amount
      )
      save_stripe_customer_id(campaign_id, current_donor.id, customer.id, amount)
      # save_stripe_customer_id(campaign_id, 2, customer.id)
    end
  end

  def is_donor
    begin
      unauthorized unless donor_signed_in?
    rescue ActionController::RoutingError
      render(file: File.join(Rails.root, 'public/403.html'), status: 403, layout: false)
    end
  end

  private

  def unauthorized
    raise ActionController::RoutingError.new('Forbidden')
  end

  def save_stripe_customer_id(campaign, donor, customer_id, amount)
    d = Donation.create(customer_id: customer_id, campaign_id: campaign, donor_id: donor)
    if d.save!
      amount = amount / 100
      Campaign.find(campaign).add_to_progress(amount)
      flash[:success] = "Thank you for contributing!"
      redirect_to campaign_path(campaign)
      # render 'donate'
    else
      flash[:notice] = "All fields are required"
      render 'donate'
    end
  end
end
