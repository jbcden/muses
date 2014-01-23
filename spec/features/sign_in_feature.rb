require_relative '../spec_helper'

describe PolymorphicSessions do
  describe "student login" do
    before {@student = FactoryGirl.create(:student)}
    it "should return a student resource" do
      @ps = PolymorphicSessions.new({student: { email: "foobar@example.com"}}).info
      @ps[:resource_name].should be(:student)
    end
  end

  describe "donor login" do
    before {@donor = FactoryGirl.create(:donor)}
    it "should return a donor resource" do
      @ps = PolymorphicSessions.new({student: { email: "foo@example.com"}}).info
      @ps[:resource_name].should be(:donor)
    end
  end
end
