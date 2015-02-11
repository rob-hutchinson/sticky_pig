require 'pry'

class Player
  attr_reader :players

def initialize
  @players = []
end

# def welcome name
#   hist = History.where(name: name).first
#   if hist
#     puts "Welcome back #{name}."
#     puts "Your history: #{hist.total} games played, #{hist.wins} wins, #{hist.losses} losses, and a #{hist.percentage}."
#   else
#     hist = History.create(name: name, wins: 0, losses: 0)
#   end
# end


def name name
  @players << name
  # welcome(name)
end

end