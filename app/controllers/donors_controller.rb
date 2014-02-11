class DonorsController < ApplicationController
  
  def show
    @donor = Donor.find(params[:id])
  end

  def index
    @messengers = Donor.all
  end

  def donate
  end

  def payment
  Stripe.api_key = "sk_test_Zt4bmu85NOFARlheHQNgxD2f"

  # Get the credit card details submitted by the form
  token = params[:stripeToken]

  # Create a Customer
  customer = Stripe::Customer.create(
    :card => token,
    :account_balance => params[:amount]
  )
  save_stripe_customer_id(current_donor, customer.id)
  redirect_to root_path
  end

  private
  def save_stripe_customer_id(donor, customer_id)
    current_donor.update_attribute(:customer_id, customer_id)
  end
end
