require 'rails_helper'

feature 'tweet', type: :feature do
let(:user) { create(:user)}

  scenario 'ログイン前には投稿ボタンが表示されない' do
  visit root_path
  expect(page).to have_no_content('\n投稿する')

  end
end