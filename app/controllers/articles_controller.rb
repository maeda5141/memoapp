class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order('created_at DESC').page(params[:page]).per(10)
  end
  def new
    @article = Article.new
  end
  def create
    
    @article = Article.create(article_params)
  end
  def show
    @article = Article.find(params[:id])
    # @comment = @article.comments.includes(:user)
  end
  def edit
    @article = Article.find(params[:id])
  end
  def update
    article = Article.find(params[:id])
    article.update(article_params)
  end
  def destroy
    article = Article.find(params[:id])
    article.destroy
  end
  private
  def article_params
    params.require(:article).permit(:title, :body, :public).merge(user_id: current_user.id)
  end
end
