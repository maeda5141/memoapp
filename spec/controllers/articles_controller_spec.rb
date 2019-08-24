require 'rails_helper'

describe ArticlesController do
 describe 'GET #new' do
  it 'newアクションのビューに遷移するか' do
    get :new
    expect(response).to render_template :new
  end
 end

end