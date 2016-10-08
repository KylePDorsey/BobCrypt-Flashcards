class Guess < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :card
  belongs_to :round

  validates :card_id, :presence => true

  def correct?
    self.potential_answer == self.card.answer
  end

  def incorrect?
    self.potential_answer != self.card.answer
  end
end
