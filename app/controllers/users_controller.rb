class UsersController < ApplicationController
  before_action :set_user, only: %i(update)

  def index
    @users = User.includes(:person).order('people.name ASC').page(params[:page])
  end

  def edit; end

  def update
    @user.update(user_params) ? (redirect_to users_path, notice: t('.notice')) : (render :edit)
  end

  private

  def set_user
    @user = URI(request.referer).path == users_path ? User.find(params[:id]) : current_user
  end

  def user_params
    params.require(:user).permit(permitted_params)
  end

  def permitted_params
    params[:user].try(:[], :password).try(:present?) ? (base_params + %i(password password_confirmation)) : base_params
  end

  def base_params
    %i(username approved)
  end
end
