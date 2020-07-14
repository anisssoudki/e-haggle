class SessionsController < ApplicationController

    def login
    end
  
    def create
      
      user = User.find_by(email: session_params[:email])
        if user && user.authenticate(session_params[:password])
        session[:user_id] = user.id
        flash[:msg] = "Logged in successfully"
        redirect_to user_path(user)
      else
        
        redirect_to login_path
        flash[:err] = "hmmm, looks like the information you entered doesn't match our records."
      end
    end
  
    def logout
      session.clear
      flash[:err] = "Logged out"
      redirect_to root_path
    end

    private

    def session_params
      params.require('session').permit(:email, :password)
    end

end
