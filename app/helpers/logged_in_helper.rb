helpers do
  def logged_in?
    session[:user_id] != nil
  end

  def current_user
    @_cached_user ||= User.find(session[:user_id]) if logged_in?
  end

  def restrict_to_user
    redirect '/401' unless logged_in?
    redirect '/401' unless current_user.id == params[:id]
  end

end
