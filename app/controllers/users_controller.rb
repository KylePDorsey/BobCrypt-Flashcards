get '/users/new' do
  erb :"users/new"
end

get "/users/login" do
  erb :'users/login'
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

post '/users' do
  User.create(params['user'])
  redirect '/'
end
