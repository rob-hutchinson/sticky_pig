require 'pry'
require './db/setup'
require './lib/all'

system 'clear'

puts "<<<<<\t\tPig and Hog Leaderboard\t\t>>>>>\n"
Scoreboard.find_each do |x|
  print "#{x.name}".ljust(7) 
  puts ">   #{x.wins} wins  \t  #{x.losses} losses  \t #{x.percentage} win percentage"
end
gets