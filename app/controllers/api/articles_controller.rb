class Api::ArticlesController < ApplicationController

  def index
    # @articles = Article.where('title LIKE(?)', "%#{params[:keyword]}%").order('id DESC')
    @articles = Article.where('title LIKE(?)', "%a%").order('id DESC')
    
  end
end
