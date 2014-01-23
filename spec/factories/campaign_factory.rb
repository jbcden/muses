FactoryGirl.define do
  factory :campaign do |f|
    f.profile_picture {fixture_file_upload(Rails.root.join('spec', 'photos', 'rails.png'), 'image/png')}
    f.firstname {"Looper"}
    f.lastname {"Cabinger"}
    f.state {"Cohio"}
    f.city {"Laberlin"}
    f.instrument {"Piano"}
    f.target_amount {"5"}
    f.age {"22"}
    f.title {"The pandas are coming"}
    f.description {"pandas will dance"}
    f.bio {"I am a panda-apple"}
  end
  factory :invalid_campaign, parent: :campaign do |f|
    f.profile_picture {nil}
  end
end
