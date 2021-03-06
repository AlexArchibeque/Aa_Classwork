class ApplicationController < ActionController::Base
    #CRLLL
    helper_method :current_user, :logged_in?

    def current_user
        @current_user ||= User.find_by( session_token: session[:session_token] )
    end

    def require_logged_in?
        redirect_to new_session_url unless logged_in?
    end

    def login!(user)
        @current_user = user
        session[:session_token] = user.reset_session_token! 
    end

    def logout!
        current_user.reset_session_token! if logged_in?
        current_user = nil
        session[:session_token] = nil
    end

    def logged_in?
        !!current_user
    end

    def is_moderator?(sub)
        logged_in? && current_user.id == sub.moderator_id
    end

    def is_author?(post)
        logged_in? && current_user.id == post.author_id
    end
end
