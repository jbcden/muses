class Comment
  attr_reader :email, :question, :first_name, :last_name

  def initialize(options = {})
    @first_name = options.fetch('first_name')
    @last_name = options.fetch('last_name')
    @email = options.fetch('email')
    @question = options.fetch('question')
  end
end
