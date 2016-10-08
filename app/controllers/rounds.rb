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
  @correct_first = @round.count_correct_first_guesses
  erb :'/rounds/show'
end
