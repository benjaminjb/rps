module RPS
  class SignupUser
    def self.run(params)
      if params['username'].empty? || params['password'].empty? || params['email'].empty?
        return {success?: false, error: 'Blank inputs detected'}
      end

      user = RPS::User.new do |u|
        u.username = params['username']
        u.email = params['email']
      end

      user.update_password(params['password'])
      user.save

      if !user.id
        return {success?: false, error: 'Could not save to database'}
      end

      {
        success?: true,
        user_id: user.id
      }
    end
  end
end