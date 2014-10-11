module RPS
  class Match < ActiveRecord::Base
    belongs_to :player1, :class => 'User'
    belongs_to :player2, :class => 'User'
  end
end