class AdminToolsController < ApplicationController

  #CanCan authorization
  load_and_authorize_resource :class => "User"

  #show all users
  def user_list
    @users = User.all
  end

  #Grant user a new role
  def grant_role
    @user = User.find_by_email(params[:email])
    @user.roles.append(Role.find_by_name(params[:role]))
    @user.save
    redirect_to action: :user_list
  end

end
