class CampaignsController < ApplicationController
  def new
    @campaign = Campaign.new
  end
  def create
    @campaign = Campaign.new(params[:campaign])
    @campaign.student_id = current_student.id
    @campaign.save
    redirect_to current_student
  end
end
