require_relative '../spec_helper'

describe "student login" do
  let(:auth_student) { create_logged_in_student }

  it "should allow access" do
    visit edit_student_registration_path(auth_student)
  end
end
