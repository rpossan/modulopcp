class LoginController < ApplicationController

  before_filter :authorize, :except => :login

  layout "main", :except => :login

  def login
    session[:user_id] = nil
    if request.post?
      user = User.authenticate(params[:login], params[:password])
      if user
        session[:user_id] = user.id
        session[:user_login] = user.login
        uri = session[:original_uri]
        session[:original_uri] = nil
        redirect_to uri || { :action => "index" }
      else
        flash[:notice] = "Usuário ou senha inválidos!"
      end
    end
  end

  def logout
    session[:user_id] = nil
    session[:new_perms] = nil
    flash[:notice] = "Logged out"
    redirect_to :action => "login"
  end

  def index
    @user = User.find(session[:user_id])
  end

end
