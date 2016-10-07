get '/users/new' do
  erb :"users/new"
end

get "/users/login" do
  erb :'users/login'
end

get '/users/:id' do
  restrict_to_user
  @user = current_user
  erb :'users/show'
end

post '/users/login' do
  @user = User.authenticate(params['email'], params['password'])
  if @user
    session[:id] = @user.id
    redirect '/'
  else
    @errors = ["Invalid credentials"]
    erb :"users/login"
  end
end

delete '/users/login' do
  restrict_to_user
  session[:id] = nil
  redirect '/'
end

post '/users' do
  User.create(params['user'])
  redirect '/'
end
