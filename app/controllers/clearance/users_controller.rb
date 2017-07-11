class Clearance::UsersController < ApplicationController
  if respond_to?(:before_action)
    before_action :redirect_signed_in_users, only: [:create, :new]
    skip_before_action :require_login, only: [:create, :new], raise: false
    skip_before_action :authorize, only: [:create, :new], raise: false
  else
    before_filter :redirect_signed_in_users, only: [:create, :new]
    skip_before_filter :require_login, only: [:create, :new], raise: false
    skip_before_filter :authorize, only: [:create, :new], raise: false
  end

  def new
    @user = user_from_params
    render template: "users/new"
  end

  def chatroom
    render template: "users/chatroom"
  end

  def create
    @user = user_from_params

    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the chat, #{@user.name}!"
      redirect_to '/'
    else
      flash[:error] = "Have you already signed up? Please sign in"
      render template: 'users/new'
    end
  end

  private

  def avoid_sign_in
    redirect_signed_in_users
  end

  def redirect_signed_in_users
    if signed_in?
      redirect_to Clearance.configuration.redirect_url
    end
  end

  def url_after_create
    Clearance.configuration.redirect_url
  end

  def user_from_params
    user_params = params[:user] || Hash.new
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    name = user_params.delete(:name)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
      user.name = name
    end
  end

  def user_params
    params[Clearance.configuration.user_parameter] || Hash.new
  end

  def permit_params
    params.require(:user).permit(:name, :email, :password)
  end
end
