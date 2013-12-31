require_relative '../../lib/exceptions'
class CampaignsController < ApplicationController

  def show
    @campaign = Campaign.find(params[:id])
  end

  def new
    @campaign = Campaign.new
  end
  def create
    @campaign = Campaign.new(params[:campaign])
    @campaign.student_id = current_student.id
    if @campaign.save
      flash[:success] = "New campaign created!"
      redirect_to current_student
    else
      flash[:notice] = "You need to fill out all required fields"
      render 'new'
    end
  end
  
  def index
    @campaigns = Campaign.all
  end

  def edit
    @campaign = Campaign.find(params[:id])
    raise Exceptions::NotAuthorizedError unless CampaignPolicy.new(current_student, @campaign).authorized?
  end

  def update
    @campaign = Campaign.find(params[:id])
    raise Exceptions::NotAuthorizedError unless CampaignPolicy.new(current_student, @campaign).authorized?
    if @campaign.update_attributes(params[:campaign])
      flash[:notice] = 'Campaign has been updated.'
      redirect_to @campaign
    else
      render 'edit'
    end
  end
  def destroy
    @campaign = Campaign.find(params[:id])
    raise Exceptions::NotAuthorizedError unless CampaignPolicy.new(current_student, @campaign).authorized?
    @campaign.destroy
    redirect_to current_student
  end
end
