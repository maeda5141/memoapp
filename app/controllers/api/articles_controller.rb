class Api::ArticlesController < ApplicationController

  def index
    @articles = Article.where(public: 1).where('title LIKE(?)', "%#{params[:keyword]}%").order('id DESC')
    
  end
end
