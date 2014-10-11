module RPS
  class CreateSession
    def self.run(params)
      user = RPS::User.find(params[:user_id])

      if !user
        return {success?: false, error: 'No such user'}
      end

      user_session = user.sessions.new
      user_session.generate_id
      user_session.save

      if !user_session
        return {success?: false, error: 'Problem creating session'}
      end

      {
        success?: true,
        session_id: user_session.session_id
      }

    end
  end
end