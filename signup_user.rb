# see lesson on learn app for transaction script
# transaction scripts should be consistent
# a) pass in the entire params hash
# b) return a hash
# c) procedural -- step by step

module RPS

  # sticking with class because we may want to instantiate it later
  class SignupUser

    # mandatory method in all transaction scripts, always the same name
    def self.run(params)

      if params['signup_first_name'].empty? || params['signup_last_name'].empty? || params['signup_username'].empty? || params['signup_password'].empty? || params['signup_password_conf'].empty?

        # can't redirect to a Sinatra endpoint from here, so have to return a hash
        return {success?: false, error: 'Blank inputs detected'}
      end

      if params['signup_password'] != params['signup_password_conf']
        return {success?: false, error: 'Password mismatch'}
      end

      user = RPS::User.new do |u|
        u.first_name = params['signup_first_name']
        u.last_name = params['signup_last_name']
        u.username = params['signup_username']
      end

      user.update_password(params['signup_password'])
      user.save

      if !user.id
        return {success?: false, error: ''}
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


# now, to call this signup_user file
# require the file in the server
# at the endpoint, 
result = RPS::SignupUser.run(params)
if result.success?
  session['rps'] = result.session_id
  redirect...
else
  flash[:alert] = result.error
end



# but the session stuff is going to be repeated elsewhere, so why not move it already into its own transaction script
module RPS
  class SignupUser
    # ...
      user = RPS::User.new do |u|
        u.first_name = params['signup_first_name']
        u.last_name = params['signup_last_name']
        u.username = params['signup_username']
      end

      user.update_password(params['signup_password'])
      user.save

      if !user.id
        return {success?: false, error: ''}
      end

      {
        success?: true
        user_id: user.id
      }
    end
  end
end

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

# in server.rb
signup_result = RPS::SignupUser.run(params)
if signup_result.success?
  session_result = RPS::CreateSession.run(signup_result)
  redirect...
else
  flash[:alert] = result.error
  redirect...
end
if session_result.success?
  session['rps'] = result.session_id
else
  redirect...
