# app/controllers/users_controller.rb

class UsersController < ApplicationController

  def new
  end
  
  def create
    @user = User.new(user_params)
    user_email = @user.email
    find_user = User.find_by email: user_email
    #puts "create method"
    #puts find_user == nil
    #puts user.email
    
    if (find_user == nil)
      if @user.save
        session[:user_id] = @user.id
        redirect_to '/', flash: {email: @user.email}
      else
        render :new
      end
    else
      redirect_to '/login', flash: {error: 'Email already exists in database. Please login.' } 
    end
    else
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end