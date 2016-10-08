get '/' do
  redirect '/decks'
end

get '/401' do
  erb :'401'
end
