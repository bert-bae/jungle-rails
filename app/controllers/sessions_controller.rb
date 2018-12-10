class SessionsController < ApplicationController

  def new
  end

  def create
    match = User.authenticate_with_credentials(params[:email], params[:password])
    user = User.find_by(email: params[:email])
    if match
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
