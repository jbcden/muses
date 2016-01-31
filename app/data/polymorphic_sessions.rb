class PolymorphicSessions
  def resources
    [
      "Student",
      "Donor"
    ]
  end

  SessionInfo = Struct.new(:auth_options, :resource_name, :warden, :paramaters)

  def initialize(paramaters)
    resources.each do  |r|
      if r.constantize.find_by_email(paramaters[:student][:email])
        paramaters[:donor] = paramaters.delete(:student) if r == "Donor"
        @info = SessionInfo.new(
          {scope: r.downcase.to_sym, recall: 'sessions#new'},
          "#{r}".downcase.to_sym,
          "#{r}".downcase.to_sym,
          paramaters)
      end
    end
  end

  def info
    Hash[@info.each_pair.to_a]
  end
end
