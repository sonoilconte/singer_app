class ApplicationController < ActionController::Base
  # current_user method to use in various controllers
  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
      p "current user is #{@current_user.email}"
      @current_user
    else
      nil
    end
  end

  def redirect_non_admin(user)
    if !user
      flash[:notice] = 'Access denied. Please log in.'
      redirect_to '/login'
    elsif user && user.email != ENV['ADMIN_EMAIL']
      flash[:notice] = 'You do not have access to the requested page. You must log in with an admin account.'
      redirect_to '/login'
    end
  end

  def redirect_unauthorized_user(user, artist_id)
    if !user
      flash[:notice] = 'Access denied. Please log in.'
      redirect_to '/login'
    # User editing an artist must be associated with the artist in join table
    elsif user && !user.artists.exists?(artist_id) && (user.email != ENV['ADMIN_EMAIL'])
      flash[:notice] = 'You do not have access to the requested artist\'s resources.'
      redirect_to '/login'
    end
  end

end
