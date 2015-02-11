class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.string :name
      t.integer :wins
      t.integer :losses
    end
  end
end
