require 'pry'
require './db/setup'
require './lib/pig_player'
require './lib/game_bacon_bits'
require './lib/history'

play = Player.new


puts "\n\nWelcome to Baconator! Please help me set up your game.\n"

puts "How many players do you have?"
gets.chomp.to_i.times do 
  puts "\nPlease enter a player name:\n"
  name = (gets.chomp.downcase.capitalize)
  play.name(name)
  hist = History.where(name: name).first
  if hist
    puts "Welcome back #{name}."
    puts "Your history: #{hist.total} games played, #{hist.wins} wins, #{hist.losses} losses, and a #{hist.percentage} win percentage."
  else
    hist = History.create(name: name, wins: 0, losses: 0)
  end
end

puts "\nWhat score would you like to play to?\n"
maxscore = gets.chomp.to_i 

puts "\nChoose mode"
puts "1) Pig"
puts "2) Hog"

choice = gets.chomp.to_i
if choice == 1
  game_class = Pig
else
  game_class = Hog
end

p = game_class.new(maxscore, play.players.length)
system 'clear'

while p.winner == false
    (0...play.players.length).each do |x|
      puts "\n#{play.players[x]}, it is your turn. You currently have #{p.scores[x]} points.\n"
      p.turn x
      binding.pry
    end
end


puts "GAME OVER"
puts "\n\nFinal Scoreboard:\n"
(0...play.players.length).map {|x| puts "#{play.players[x]}: #{p.scores[x]}"}
# high_score, y = 0, 0
  # (0...play.players.length).map do |x|
  #   if p.scores[x] > high_score
  #     high_score = p.scores[x]
  #     y = x
  #   end
  # end
  # p.remove_losing_players!(play.players, p.scores)
  puts "#{} wins!!!."
  


