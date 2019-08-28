require 'rails_helper'

feature 'tweet', type: :feature do
let(:user) { create(:user)}

  scenario 'post article' do
  #ログイン前には投稿ボタンが現れない
  visit root_path
  expect(page).to have_no_content('\n投稿する')

  #ログイン処理
  visit new_user_session_path
  fill_in 'user_email', with: user.email
  fill_in 'user_password', with: user.password
  find('input[name="commit"]').click
  expect(current_path).to eq root_path
  expect(page).to have_content('投稿する')

  #メモの投稿
  expect{
    click_link('投稿する')
    expect(current_path).to eq new_article_path
    fill_in 'article_title', with: 'テスト'
    fill_in 'article_body', with: 'テストテスト'
    find('input[name="commit"]').click
  }.to change(Article, :count).by(1)



  end
end