require 'rails_helper'

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
  end
 end

end