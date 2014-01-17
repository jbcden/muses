require_relative '../spec_helper'

describe Student do
  before(:each) do
    visit muses_sign_up_path
    @student = FactoryGirl.build(:student)
  end
  it "should not be allowed to register with invalid credentials" do
    fill_in "Email", :with => @student.email
    fill_in "Password", :with => @student.password
    fill_in "Password confirmation", :with => "applestopandas"
    click_button "Sign up"
    page.should_not have_content("A message with a confirmation link")
  end

  it "should be registered and an email sent if valid credentials are provided" do
    fill_in "Email", :with => @student.email
    fill_in "Password", :with => @student.password
    fill_in "Password confirmation", :with => @student.password_confirmation
    click_button "Sign up"
    page.should have_content("A message with a confirmation link")
    expect { Devise::Mailer.delay.confirmation_instructions }.to change(Sidekiq::Extensions::DelayedMailer.jobs, :size).by(1)
  end
end
