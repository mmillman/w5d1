module SessionsHelper
  def sign_in(user)
    user.token = User.generate_token
    session[:token] = user.token
    self.current_user = user
  end

  def current_user
    @current_user ||= User.find_by_token(session[:token])
  end

  def current_user=(user)
    @current_user = user
  end

  def sign_out
    current_user.token = nil
    self.current_user = nil
    session.delete(:token)
  end

  def signed_in?
    @current_user ? true : false
  end
end
