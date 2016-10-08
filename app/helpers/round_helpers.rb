helpers do
  def begin_next_pass_if_empty
    if @potential_cards.length > 0
      card_to_display = @potential_cards.sample
      redirect "/rounds/#{@round.id}/cards/#{card_to_display.id}"
    end
  end

  def cards_answered_incorrectly_this_pass
    @cards.find_all do |card|
      card.guesses.where(round_id: @round.id).last.incorrect?
    end
  end



end
