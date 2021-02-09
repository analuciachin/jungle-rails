class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.authenticate_with_credentials(params[:email], params[:password])
    if user
      # success logic, log them in
      redirect_to '/', flash: {email: user.email}
    else
      # failure, render login form
      redirect_to '/login', flash: {error: "Wrong password. Please try again."}
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end