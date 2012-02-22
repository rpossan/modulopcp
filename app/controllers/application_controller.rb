require 'rubygems'
require 'cgi'

# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base

  helper_method :session_user

  def restart_db
    User.find_by_sql(
    "
      DELETE FROM equipamentos;
      DELETE FROM funcionarios;
      DELETE FROM ordems;
      DELETE FROM processos;
      DELETE FROM produto_processos;
      DELETE FROM produtos;
    "
    )
    render(:text => "OK")
  end

  def session_user
    @session_user ||= User.find_by_id(session[:user_id])
  end

  def authorize
    unless User.find_by_id(session[:user_id])
      session[:original_uri] = request.request_uri
      flash[:notice] = "Por favor efetue login!"
      redirect_to :controller => "login", :action => "login"
    end
  end

  def txt(t)
    if not t.nil?
      t = t.gsub("'", "\\\\'")
      t = t.gsub("\n", '\n')
      t = t.gsub(/<\/?[^>]*>/, "")
    end
    return t
  end

end
