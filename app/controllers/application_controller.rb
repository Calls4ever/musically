class ApplicationController < ActionController::Base
    helper_method :logged_in?
    before_action :current_user
    before_action :authorized

    def current_user    
        @current_user = User.find_by(id: session[:user_id])  
    end

    def logged_in?
        !current_user.nil?  
    end

    def authorized
        redirect_to new_user_path unless @current_user
    end
    
end
