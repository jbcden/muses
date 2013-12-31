# require_relative '../../lib/exceptions'
class StudentPolicy
  attr_reader :user, :current

  def initialize(user, current)
    @user = user
    @current = current
  end

  def authorized?
    current == user
  end
end
