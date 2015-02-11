require 'pry'

class Game
  attr_reader :maxscore, :scores, :winning_player

  def initialize maxscore=nil, players=2
    @maxscore = maxscore || 100
    @scores = Array.new(players, 0)
    @winner = false
    @winning_player
  end

  def die_roll
    rand(1..6)
  end

  def winner players
    (0...@scores.length).map{|x| 
      if @scores[x]>=@maxscore
        @winning_player = players[x] 
      end }
      @winning_player
    end
  end

  class Pig < Game

    def initialize maxscore=nil, players=2
      super
      @temp_score = 0
    end

    def turn player
      loop do
        roll = die_roll
        unless roll == 1
          @temp_score += roll
          puts "You rolled #{roll}. Your score for the turn is now #{@temp_score}.\n"
          puts "Would you like to roll again?"
          if gets.chomp == "n"
            bank(player)
            puts "\nYour score is now #{scores[player]}.\n\n"
            sleep(1)
            puts "\n-----------------------------------------------\n"
            return
          end
        else
          @temp_score = 0
          puts "\nSorry! You rolled a #{roll}. Your score is still #{scores[player]}.\n\n"
          puts "\n-----------------------------------------------\n"
          return
        end
      end
    end

    def bank player_num=0
      @scores[player_num] += @temp_score
      @temp_score = 0
    end
  end

  class Hog < Game

    def initialize maxscore=nil, players=2
      super
    end

    def dice_num x
      @dice_num = x
    end

    def turn player
      dice_holder = []
      puts "How many dice would you like to roll?\n"
      gets.chomp.to_i.times do dice_holder << die_roll end
        puts "You rolled #{dice_holder} and your score for the turn was #{check(dice_holder,player)}."
        puts "\nYour score is now #{scores[player]}.\n\n"
        sleep(1)
        puts "\n-----------------------------------------------\n"
    end

      def check x, player_num=0
        if x.include?(1)
          0
        else
          @scores[player_num] += x.inject(:+)
          x.inject(:+)
        end
      end
    end

