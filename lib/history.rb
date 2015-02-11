class History < ActiveRecord::Base

  def total
    wins + losses
  end

  def percentage
    ((wins*100.0)/(wins + losses)).round(2)
  end
end