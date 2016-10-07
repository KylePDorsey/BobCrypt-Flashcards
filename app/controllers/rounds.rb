get '/rounds/:id' do
  @round = Round.find(params[:id])
  @cards = Card.where(deck_id: @round.deck_id)
  @guessed_cards = @round.guessed_cards
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
