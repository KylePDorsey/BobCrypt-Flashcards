class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.integer :card_id
      t.integer :round_id
      t.string :potential_answer

      t.timestamps(null: false)
    end
  end
end
