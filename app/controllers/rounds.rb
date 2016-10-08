get '/rounds/:id' do
  @round = Round.find(params[:id])
  @cards = Card.where(deck_id: @round.deck_id)

  @potential_cards = @cards - @round.guessed_cards

  begin_next_pass_if_empty
  @potential_cards += cards_answered_incorrectly_this_pass
  begin_next_pass_if_empty

  redirect "/rounds/#{@round.id}/complete"
end

post '/rounds' do
  @round = Round.new(deck_id: params[:deck_id])

  @round.user = current_user if logged_in?

  @round.save
  redirect "/rounds/#{@round.id}"
end

get '/rounds/:id/complete' do
  @round = Round.find_by(id: params[:id])
  deck_length = @round.deck.cards.count
  round_guesses = Guess.where(round_id: @round.id)
  first_guesses = round_guesses.limit(deck_length)
  correct_first_guesses = first_guesses.find_all { |guess| guess.correct? }
  @correct_first = correct_first_guesses.count
  erb :'/rounds/show'
end
