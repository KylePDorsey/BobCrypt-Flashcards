get '/rounds/:round_id/cards/:card_id' do
  @card = Card.find_by(id: params[:card_id])
  @round = Round.find_by(id: params[:round_id])
  erb :'/cards/show'
end
