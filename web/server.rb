require_relative '../lib/rps.rb'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/content_for'
require 'rack-flash'
require 'pry-byebug'

set :bind, '0.0.0.0'

class RPS::Server < Sinatra::Application

  # configure do
  #   use Rack::Flash
  #   use Rack::Session::Cookie, :key => 'rack.session',
  #                              :path => '/',
  #                              :expire_after => 31_536_000, # a year in seconds
  #                              :secret => 'my secret'
  # end

  get '/' do
    @player_logged_in = {"username" => "ben"}
    erb :welcome
    # redirect to '/landing'
  end

# >>>>>>>>>>>>>>>>>>>>

# # now, to call this signup_user file
# # require the file in the server
# # at the endpoint, 
# result = RPS::SignupUser.run(params)
# if result.success?
#   session['rps'] = result.session_id
#   redirect...
# else
#   flash[:alert] = result.error
# end


# # in server.rb
# signup_result = RPS::SignupUser.run(params)
# if signup_result.success?
#   session_result = RPS::CreateSession.run(signup_result)
#   redirect...
# else
#   flash[:alert] = result.error
#   redirect...
# end
# if session_result.success?
#   session['rps'] = result.session_id
# else
#   redirect...

# <<<<<<<<<<<<<<<<<<<



#   post '/sign_up' do
#     if params['username'].empty? || params['password'].empty? || params['email'].empty?
#       flash[:alert] = "Blank inputs!"
#       redirect to '/landing'
#     end

#     if RPS::User.find_by(username: params['username'])
#       "USER ALREADY EXISTS. TRY AGAIN"
#     else
#       user = RPS::User.new(username: params['username'], password_digest: params['password'], email: params['email'])
#       user.save

#       # user_session = user.sessions.new
#       # user_session.generate_id
#       # user_session.save

#       # session['mks_session_example'] = user_session.session_id
      
#       redirect to '/player?id = user.id'
#     end
#   end

#   post '/sign_in' do
#     if params['username'].empty? || params['password'].empty?
#       redirect to '/landing'
#     end
  
#     user = MKS::User.find_by(username: params['username'])
  
#     if user && user.has_password?(params['password'])
#       # user_session = user.sessions.new
#       # user_session.generate_id
#       # user_session.save

#       # session['mks_session_example'] = user_session.session_id
#       redirect to '/player/:id'
#     else
#       flash[:alert] = "THERE WAS A PROBLEM!!!!"
#       redirect to '/landing'
#     end
#   end

#   get '/signout' do
#     # sesh = RPS::Session.find_by(session_id: session['mks_session_example'])
#     # sesh.destroy
#     # session.clear
#     redirect to '/landing'
#   end

#   get '/player/:id' do
#     player = RPS::Repos::users.find_by id: params[:id]
#     # game_list = RPS::Repos::users.find_by id: params[:id]
#     # find all games in order of recency
#     # Client.order(created_at: :desc)

#     erb :player, :locals => {
#       player_stats: # 
#     }

#   end

#   get '/player_stats/' do
#     players = # run program to return players, stats, favorite move
#     # names, wins, losses, favorite, in a hash
#     erb :player_stats, :locals => {
#       every_player: players
#     }
#   end

#   post '/game/:game_id' do
#     # params[:game_id]
#     # get the match, display the rounds
#     # rounds will be a hash of player names with plays


#     erb :index, :locals => {
#       rounds: rounds
#     }
#   end

#   get '/game/:opponent_id' do

#     game = # start a new game, find the id of the match, then redirect

#     redirect '/game/?game_id = game.id'
#   end

#   post '/play' do
#     params['fight']

#   end

  run! if __FILE__ == $0
end