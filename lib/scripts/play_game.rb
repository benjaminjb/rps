module RPS
  class PlayGame
    def self.run(data)
      p1_move = data[:p1_move]
      p2_move = data[:p2_move]

      beats = {
        :scissors => :rock,
        :paper => :scissors,
        :rock => :paper
      }

      if p1_move == beats[p2_move]
        return {
          success?: true,
          winner: :player_1
        }
      elsif p2_move == beats[p1_move]
        return {
          success?: true,
          winner: :player_2
        }
      else
        return {
          success?: true,
          winner: :draw
        }
      end
    end
  end
end

# check to see if you have two moves, then send to the transaction script

# transcation scripts make testing easier, because now we can test the little pieces and only later run the server