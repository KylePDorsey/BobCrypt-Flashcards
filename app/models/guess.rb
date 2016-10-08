class Guess < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :card
  belongs_to :round

  validates :card_id, :presence => true
end
