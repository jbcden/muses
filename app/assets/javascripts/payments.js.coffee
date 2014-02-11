jQuery ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  donation.setupForm()

donation =
  setupForm: ->
    $('#payment-form').submit ->
      $('input[type=submit]').attr('disabled', true)
      donation.processCard()
      return false

  processCard: ->
    card =
      number: $('.card-number').val()
      cvc: $('.card-cvc').val()
      expMonth: $('.card-expiry-month').val()
      expYear: $('.card-expiry-year').val()
    Stripe.createToken(card, donation.handleStripeResponse)

  handleStripeResponse: (status, response) ->
    if status == 200
      # alert(response.id)
      $('#stripe_card_token').val(response.id)
      # $('#payment_submit')[0].submit()
      $('#payment-form')[0].submit()
    else
      # alert(response.error.message)
      $('.payment-errors').text(response.error.message)
      $('input[type=submit]').attr('disabled', false)
