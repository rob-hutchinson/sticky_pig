class Scoreboard < ActiveRecord::Base

  def total
    wins + losses
  end

  def percentage
    if (wins + losses) == 0
      0.0
    else
      ((wins*100.0)/(wins + losses)).round(2)
    end
  end
end