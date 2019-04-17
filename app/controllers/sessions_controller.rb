class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    p 'params', params
    user = User.find_by_email(params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      p 'access permitted, session[:user_id]', session[:user_id]
      redirect_to "/artists/2/edit"
    else
      p 'access denied'
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    p 'session[:user_id]', session[:user_id]
    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
