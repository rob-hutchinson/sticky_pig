require 'pry'

class Game
  attr_reader :maxscore, :scores

  def initialize maxscore=nil, players=2
    @maxscore = maxscore || 100
    @scores = Array.new(players, 0)
    @winner = false
  end

  def die_roll
    rand(1..6)
  end

  def winner
    (0...@scores.length).map{|x| 
      if @scores[x]>=@maxscore
        @winner = true 
      end }
      @winner
    end
  end

  class Pig < Game
    attr_reader :temp_score

    def initialize maxscore=nil, players=2
      super
      @temp_score = 0
    end

    def turn
      roll = die_roll
      unless roll == 1
        @temp_score += roll
        roll
      else
        @temp_score = 0
        1
      end
    end

    def bank player_num=0
      @scores[player_num] += @temp_score
      @temp_score = 0
    end
  end

  class Hog < Game
    attr_reader :dice_holder

    def initialize maxscore=nil, players=2
      super
      @dice_num = 0
      @dice_holder = []
    end

    def dice_num x
      @dice_num = x
    end

    def turn
      @dice_holder = []
      @dice_num.times do @dice_holder << die_roll end
        @dice_holder
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

