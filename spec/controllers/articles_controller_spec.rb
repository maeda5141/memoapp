require 'rails_helper'
Faker::Config.locale = :ja

describe ArticlesController do
 describe 'GET #new' do
  it 'newアクションのビューに遷移するか' do
    get :new
    expect(response).to render_template :new
  end
 end
 describe 'GET #edit' do
  it 'editアクションの@articleが期待された値になっているか' do
    user = create(:user, id:1)
    article = create(:article)
    get :edit, params: {id: article}
    expect(assigns(:article)).to eq article
  end
 
  it 'editアクションのビューに遷移するか' do
    user = create(:user, id:1)
    article = create(:article)
    get :edit, params: {id: article}
    expect(response).to render_template :edit
  end
 end

 describe 'GET #index' do
  it '@articlesがcreated_atの降順で取得できるか' do
    user = create(:user, id:1)
    articles = create_list(:article, 3, created_at: Faker::Time.between(DateTime.now - 2, DateTime.now))
    articles.sort{|a, b| b.created_at <=> a.created_at }
    get :index
    expect(assigns(:articles)).to match(articles)
  end
  it 'indexアクションのビューに遷移するか' do
    get :index
      expect(response).to render_template :index
  end
 end

end