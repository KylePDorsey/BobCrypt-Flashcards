get '/rounds/:id' do
  round = Round.find(params[:id])
  cards = Card.where(deck_id: round.deck_id)
  guessed_cards = round.guessed_cards
  potential_cards = cards - guessed_cards
  if potential_cards.length > 0
    card_to_display = potential_cards.sample
    redirect "/rounds/#{round.id}/cards/#{card_to_display.id}"
  else
    cards.each do |card|
      guesses = card.guesses.where(round_id: round.id)
      if guesses.last.incorrect?
        potential_cards << card
      end
    end

    if potential_cards.length > 0
      card_to_display = potential_cards.sample
      redirect "/rounds/#{round.id}/cards/#{card_to_display.id}"
    end
  end
  redirect "/rounds/#{round.id}/complete"
end

post '/rounds' do
  @round = Round.new(deck_id: params[:deck_id])
  if logged_in?
    @round.user = current_user
  end
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
