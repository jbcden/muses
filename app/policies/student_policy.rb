# require_relative '../../lib/exceptions'
class StudentPolicy
  attr_reader :user, :current

  def initialize(user, current)
    @user = user
    @current = current
  end

  def authorized?
    raise ActionController::RoutingError.new('Forbidden') unless current == user
  end
end
