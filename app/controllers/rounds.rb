get '/rounds/:id' do
  round = Round.find(params[:id])
  cards = Card.where(deck_id: round.deck_id)
  guessed_cards = round.guessed_cards
  potential_cards = cards - guessed_cards
  if potential_cards.length > 0
    card_to_display = potential_cards.sample
    redirect "/rounds/#{round.id}/cards/#{card_to_display.id}"
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

get 'rounds/:id/complete' do
end
