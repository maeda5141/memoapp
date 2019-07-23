class Api::ArticlesController < ApplicationController

  def index
    @articles = Article.where(public: 1).where('title LIKE(?)', "%#{params[:keyword]}%").order('id DESC').page(params[:page]).per(10)
    
  end
end
