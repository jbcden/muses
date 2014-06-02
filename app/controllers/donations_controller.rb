class DonationsController < ApplicationController
  before_filter :is_donor, :only => [:create, :donate, :payment]

  def donate
    @campaign_id = params[:campaign_id] 
  end

  def payment
    Stripe.api_key = ENV['STRIPE_SECRET_KEY_PRODUCTION']
    campaign_id = params[:campaign_id]
    token = params[:stripe_card_token]
    donation = params[:amount].to_i
    amount = params[:amount].dup.to_f
    amount += ((amount * 0.029) + 0.30)
    amount = amount.round
    amount = amount.to_i * 100
    # amount = (params[:amount].to_i * 100) # do math here -- API requires an int here

    customer = nil
    save_customer = true
    if token
      begin
        customer = Stripe::Customer.create(
          :card => token,
          :account_balance => amount
        )
      rescue Stripe::CardError => e
        # Since it's a decline, Stripe::CardError will be caught
        body = e.json_body
        err  = body[:error]
        save_customer = false

        flash[:alert] = "#{err[:message]}"
        redirect_to donate_path(:campaign_id => campaign_id)
      rescue Stripe::InvalidRequestError => e
        # Invalid parameters were supplied to Stripe's API
        body = e.json_body
        err  = body[:error]
        save_customer = false

        flash[:alert] = "#{err[:message]}"
        redirect_to donate_path(:campaign_id => campaign_id)
      rescue Stripe::AuthenticationError => e
        # Authentication with Stripe's API failed  --- display 500 error page
        # (maybe you changed API keys recently)
        body = e.json_body
        err  = body[:error]
        save_customer = false

        flash[:alert] = "#{err[:message]}"
        redirect_to donate_path(:campaign_id => campaign_id)
      rescue Stripe::APIConnectionError => e
        # Network communication with Stripe failed --- display 500 error page
        body = e.json_body
        err  = body[:error]
        save_customer = false

        flash[:alert] = "#{err[:message]}"
        redirect_to donate_path(:campaign_id => campaign_id)
      rescue Stripe::StripeError => e
        # Display a very generic error to the user, and maybe send --- display 500 error and send email?
        # yourself an email
        body = e.json_body
        err  = body[:error]
        save_customer = false

        flash[:alert] = "#{err[:message]}"
        redirect_to donate_path(:campaign_id => campaign_id)
      rescue => e
        # Something else happened, completely unrelated to Stripe --- display 500 error and send email

        save_customer = false
        redirect_to donate_path(:campaign_id => campaign_id)
      end
      save_stripe_customer_id(campaign_id, current_donor.id, customer.id, donation) if save_customer
      # save_stripe_customer_id(campaign_id, 2, customer.id)
    end
  end

  def is_donor
    begin
      unauthorized unless donor_signed_in?
    rescue ActionController::RoutingError
      render(file: File.join(Rails.root, 'public/403.html'), status: 403, layout: false)
      # save_stripe_customer_id(@campaign_id, current_donor.id, customer_id)
    end
  end

  private

  def unauthorized
    raise ActionController::RoutingError.new('Forbidden')
  end

  def save_stripe_customer_id(campaign, donor, customer_id, amount)
    d = Donation.create(customer_id: customer_id, campaign_id: campaign, donor_id: donor)
    if d.save!
      Campaign.find(campaign).add_to_progress(amount)
      flash[:success] = "Thank you for contributing!"
      redirect_to campaign_path(campaign)
      # render 'donate'
    else
      flash[:alert] = "All fields are required"
      redirect_to donate_path(:campaign_id => @campaign_id)
    end
  end
end
