class ChargesController < ApplicationController
  def new
  end

  def create
    customer = Stripe::Customer.create(
      account_balance = params[:amount],
      card = params[:stripeToken]
    )

  end
end
