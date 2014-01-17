FactoryGirl.define do
  factory :student do
    email   "foobar@example.com"
    password "applestoapples"
    password_confirmation "applestoapples"
  end

  factory :donor do
    email "foo@example.com"
    password "applestoapples"
    password_confirmation "applestoapples"
    firstname "Jacob"
    lastname "Chae"
    profile_picture { fixture_file_upload(Rails.root.join('spec', 'photos', 'rails.png'), 'image/png') }
  end
end
