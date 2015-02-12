class CreateScoreboard < ActiveRecord::Migration
  def change
      create_table :scoreboards do |t|
      t.string :name
      t.integer :wins
      t.integer :losses
    end
  end
end
