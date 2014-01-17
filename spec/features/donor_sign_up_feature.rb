require_relative '../spec_helper'

describe Donor do
  before(:each) do
    visit messengers_sign_up_path
    @donor = FactoryGirl.build(:donor)
  end
  it "should not be allowed to register with invalid credentials" do
    attach_file "Profile Picture", '../photos/rails.png'
    fill_in "First Name", :with => @donor.firstname
    fill_in "Last Name", :with => @donor.lastname
    fill_in "Email", :with => @donor.email
    fill_in "Password", :with => @donor.password
    fill_in "Password confirmation", :with => 'applestopandas'
    click_button "Sign up"
    page.should_not have_content("A message with a confirmation link")
  end

  it "should be registered and an email sent if valid credentials are provided" do
    attach_file "Profile Picture", '../photos/rails.png'
    fill_in "First Name", :with => @donor.firstname
    fill_in "Last Name", :with => @donor.lastname
    fill_in "Email", :with => @donor.email
    fill_in "Password", :with => @donor.password
    fill_in "Password confirmation", :with => @donor.password_confirmation
    click_button "Sign up"
    page.should have_content("A message with a confirmation link")
    expect { Devise::Mailer.delay.confirmation_instructions }.to change(Sidekiq::Extensions::DelayedMailer.jobs, :size).by(1)
  end
end
