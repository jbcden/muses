require_relative '../../lib/exceptions'
class CampaignPolicy
  attr_reader :user, :campaign

  def initialize(user, campaign)
    @user = user
    @campaign = campaign
  end

  # may want to uncomment these and add custom authorization for actions at a later date -- for now it suffices to check that the student 'owning' the campaign is doing the action.

  # def edit?
  #   authorized?
  # end

  # def update?
  #   authorized?
  # end

  def authorized?
    if user.nil?
      raise Exceptions::NotAuthorizedError
    else
      user.id == campaign.student_id
    end
  end
end
