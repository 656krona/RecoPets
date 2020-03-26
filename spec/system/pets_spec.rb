require 'rails_helper'

describe 'ペット管理機能', type: :system do
  let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com') }
  let(:user_b) { FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com') }
  let!(:pet_a) { FactoryBot.create(:pet, name: '最初のペット', user: user_a) }

  before do
    # ログインする
    visit new_user_session_path
    fill_in 'user[email]', with: login_user.email
    fill_in 'user[password]', with: login_user.password
    click_button 'SIGN IN'
  end
  # 作成済みのペットの名称が画面上に表示されていることを確認
  shared_examples_for 'ユーザーAが作成したペットが表示される' do
    it { expect(page).to have_content '最初のペット' }
  end

  describe '一覧表示機能' do
    context 'ユーザーAがログインしている時' do
      let(:login_user) {user_a}

      it_behaves_like 'ユーザーAが作成したペットが表示される'
    end

    context 'ユーザーBがログインしている時' do
      let(:login_user) {user_b}

      it 'ユーザーAが作成したペットが表示されない' do
        # ユーザーAが作成したペットの名前が画面上に表示されていないことを確認
        expect(page).to have_no_content '最初のペット'
      end
    end
  end

  describe '詳細表示機能' do
    context 'ユーザーAがログインしている時' do
     let(:login_user) {user_a}

     before do
      visit pet_path(pet_a)
     end

      it_behaves_like 'ユーザーAが作成したペットが表示される'
    end
  end
end