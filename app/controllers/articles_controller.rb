class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @articles = Article.all.where(public: 1).order('created_at DESC').page(params[:page]).per(10)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)
  end

  def show

    @article = Article.find_by(id: params[:id])
    if @article == nil
      flash[:fail] = "削除されています"
      redirect_to root_path
      return
    end

    if user_signed_in?
      if @article.user.id != current_user.id && @article.public == 0
        flash[:fail] = "投稿者によって非公開に設定されています"
        redirect_to root_path
      end
    else
      if @article.public == 0
        flash[:fail] = "投稿者によって非公開に設定されています"
      redirect_to root_path
      end
    end
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
