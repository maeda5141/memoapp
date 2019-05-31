class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
    @articles = current_user.articles.order('created_at DESC').page(params[:page]).per(10)
  end
end
