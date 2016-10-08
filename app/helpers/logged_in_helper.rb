helpers do
  def logged_in?
    session[:id] != nil
  end

  def current_user
    User.find_by(id: session['id'])
  end

  def restrict_to_user(owner_id)
    redirect '/401' unless logged_in?
    redirect '/401' unless current_user.id == owner_id
  end

end
