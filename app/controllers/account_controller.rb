class AccountController < ApplicationController
  
  before_filter :confirm_logged_in, :except => [:new, :create, :login, :attempt_login, :logout]
     
  def index
    render("users/edit/")
  end
  
end