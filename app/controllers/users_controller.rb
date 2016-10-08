before do
  @user = current_user
end

get '/users/new' do
  erb :"users/new"
end

get "/users/login" do
  erb :'users/login'
end

get '/users/:id' do
  restrict_to_user(params[:id].to_i)
  @decks = Deck.all
  erb :'users/show'
end

post '/users/login' do
  @email = params['user']['email']
  @password = params['user']['password']
  @user = User.authenticate(@email, @password)
  if @user
    session[:id] = @user.id
    redirect '/'
  else
    @errors = ["Invalid credentials"]
    erb :"users/login"
  end
end

delete '/users/logout' do
  session[:id] = nil
  redirect '/'
end

post '/users' do
  @user = User.create(params['user'])
  if @user.valid?
    session[:id] = @user.id
    redirect '/'
  else
    @errors = @user.errors.full_messages
    erb :'/users/new'
  end
end
