require_relative '../data/comment'
class ApplicationController < ActionController::Base
  protect_from_forgery

  def home
  end
  def contact_us
  end
  def submit_comment
    @comment = Comment.new(params)
    ApplicationMailer.delay.comment_submission(@comment)
    render 'contact_us'
  end
end
