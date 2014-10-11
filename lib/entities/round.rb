module RPS
  class Round < ActiveRecord::Base
    belongs_to :matches
  end
end