require_relative '../spec_helper'
include Warden::Test::Helpers

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
