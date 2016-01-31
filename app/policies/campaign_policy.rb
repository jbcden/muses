require_relative '../../lib/exceptions'
class CampaignPolicy
  attr_reader :user, :campaign

  def initialize(user, campaign)
    @user = user
    @campaign = campaign
  end

  def edit?
    authorized?
  end

  def update?
    authorized?
  end

  def authorized?
    if user.nil?
      raise ActionController::RoutingError.new('Forbidden')
    else
      user.id == campaign.student_id
    end
  end
end
