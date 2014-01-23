require_relative '../spec_helper'
include Warden::Test::Helpers
module ControllerMacros

  def create_logged_in_student
    student = FactoryGirl.build(:student)
    student.confirmed_at = Time.now
    student.save
    login(student)
    student
  end

  def login(user)
    login_as user, scope: :student
  end

  def login_student
    before(:each) do
      @request.env["devise_mapping"] = Devise.mappings[:student]
      student = FactoryGirl.create(:student)
      student.confirm!
      sign_in student
      student
    end
  end
end
