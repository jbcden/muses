require_relative '../spec_helper'

describe CampaignsController do
  login_student
  describe "GET #index" do
    it "should return a list of campaigns in an array" do
      campaign = FactoryGirl.create(:campaign)
      get :index
      assigns(:campaigns).should eq([campaign])
    end

    it "should render the index template" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET #show" do
    it "should return the correct campaign object" do
      campaign = FactoryGirl.create(:campaign)
      get :show, id: campaign
      assigns(:campaign).should eq(campaign)
    end

    it "renders the show view" do
      get :show, id: FactoryGirl.create(:campaign)
      response.should render_template :show
    end
  end

  describe "POST #create" do
    context "with valid attrs" do
      it "should create a new campaign" do
        expect {
          post :create, campaign: FactoryGirl.attributes_for(:campaign)
        }.to change(Campaign, :count).by(1)
      end

      it "should redirect to the current student's page" do
        post :create, campaign: FactoryGirl.attributes_for(:campaign)
        response.should redirect_to Student.last # won't recognize current_student -- need to try to fix this...
      end
    end
    context "with invalid attrs" do
      it "should not create a campaign" do
        expect {
          post :create, campaign: FactoryGirl.attributes_for(:invalid_campaign)
        }.to change(Campaign, :count).by(0)
      end

      it "should re-render the new campaign form" do
        post :create, campaign: FactoryGirl.attributes_for(:invalid_campaign)
        response.should render_template :new
      end
    end
  end

  describe "PUT #update" do
    before :each do
      @campaign = FactoryGirl.create(:campaign)
    end

    context "valid attrs" do
      it "it retrieves the correct campaign" do
        put :update, id: @campaign, campaign: FactoryGirl.attributes_for(:campaign)
        assigns(:campaign).should eq(@campaign)
      end

      it "changes @campaign's attrs" do
        put :update, id: @campaign, campaign: FactoryGirl.attributes_for(:campaign, :firstname => "Jooper")
        @campaign.reload
        @campaign.firstname.should eq("Jooper")
      end

      it "should redirect to the updated campaign" do
        put :update, id: @campaign, campaign: FactoryGirl.attributes_for(:campaign, :firstname => "Jooper")
        response.should redirect_to @campaign
      end
    end

    context "invalid attrs" do
      it "should find the correct campaign" do
        put :update, id: @campaign, campaign: FactoryGirl.attributes_for(:invalid_campaign)
        assigns(:campaign).should eq(@campaign)
      end

      it "should not change the campaign's attrs" do
        put :update, id: @campaign, campaign: FactoryGirl.attributes_for(:invalid_campaign, firstname: "Jooper", lastname: nil)
        @campaign.reload
        @campaign.firstname.should_not eq("Jooper")
        @campaign.lastname.should eq("Cabinger")
      end

      it "re-renders the edit page" do
        put :update, id: @campaign, campaign: FactoryGirl.attributes_for(:invalid_campaign)
        response.should render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @campaign = FactoryGirl.create(:campaign)
    end

    it "should delete the campaign" do
      expect {
        delete :destroy, id: @campaign
      }.to change(Campaign, :count).by(-1)
    end
  end
end
