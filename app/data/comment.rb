class Comment
  attr_reader :email, :question, :name

  def initialize(options = {})
    @name = options.fetch('name')
    @email = options.fetch('email')
    @question = options.fetch('question')
  end
end
