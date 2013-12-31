class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@mmuses.org"

  def comment_submission(comment)
    @comment = comment
    mail(:to => comment.email, :bcc => 'no-reply@mmuses.org', :subject => 'Your comment has been received')
  end
end
