require 'pry'
require './db/setup'
require './lib/all'

play = Player.new
losers = []

puts "\n\nWelcome to Baconator! Please help me set up your game.\n"

puts "How many players do you have?"
gets.chomp.to_i.times do 
  puts "\nPlease enter a player name:\n"
  name = (gets.chomp.downcase.capitalize)
  play.name(name)
  hist = Scoreboard.where(name: name).first
  if hist
    puts "Welcome back #{name}."
    puts "Your history: #{hist.total} games played, #{hist.wins} wins, #{hist.losses} losses, and a #{hist.percentage} win percentage."
  else
    hist = Scoreboard.create(name: name, wins: 0, losses: 0)
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

until p.winner play.players
  (0...play.players.length).each do |x|
    puts "\n#{play.players[x]}, it is your turn. You currently have #{p.scores[x]} points.\n"
    p.turn x
  end
end


puts "GAME OVER"
puts "\n\nFinal Scoreboard:\n"
(0...play.players.length).map {|x| puts "#{play.players[x]}: #{p.scores[x]}"}
puts "#{p.winning_player} wins!!!"

hist = Scoreboard.where(name: p.winning_player).first
hist.wins += 1
hist.save!

puts "#{p.winning_player}'s history: #{hist.total} games played, #{hist.wins} wins, #{hist.losses} losses, and a #{hist.percentage} win percentage."
losers = play.players.select{ |x| x != p.winning_player}
losers.each do |x|
  hist = Scoreboard.where(name: x).first
  hist.losses += 1
  hist.save!
end
binding.pry

