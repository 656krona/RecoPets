require 'rails_helper'

describe 'ユーザー権限のテスト', type: :system do
  let!(:user) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com') }
  let!(:pet) { FactoryBot.create(:pet, name: '最初のペット', user: user) }
  #let!(:item) { FactoryBot.create(:item, name: '最初のアイテム', user: user) }
  let!(:record) { FactoryBot.create(:record, history: '最初の履歴', pet: pet) }

  describe 'ペットのURLにアクセス' do
    context 'ユーザーがログインしていない場合' do
      it '一覧画面に遷移できない' do
        visit pets_path
        expect(current_path).to eq('/users/sign_in')
      end
      it '編集画面に遷移できない' do
        visit edit_pet_path(pet.id)
        expect(current_path).to eq('/users/sign_in')
      end
      it '詳細画面に遷移できない' do
        visit pet_path(pet.id)
        expect(current_path).to eq('/users/sign_in')
      end
    end
  end
  describe 'レコードのURLにアクセス' do
    context 'ユーザーがログインしていない場合' do
      it '編集画面に遷移できない' do
        visit edit_pet_record_path(pet.id,record.id)
        expect(current_path).to eq('/users/sign_in')
      end
      it '病院選択画面に遷移できない' do
        visit select_pet_record_path(pet.id,record.id)
        expect(current_path).to eq('/users/sign_in')
      end
    end
  end
  describe 'ユーザー関連のURLにアクセス' do
    context 'ユーザーがログインしていない場合' do
      it '編集画面に遷移できない' do
        visit edit_user_path(user.id)
        expect(current_path).to eq('/users/sign_in')
      end
      it '詳細画面に遷移できない' do
        visit user_path(user.id)
        expect(current_path).to eq('/users/sign_in')
      end
    end
  end
  # describe '在庫管理関連のURLにアクセス' do
  #   context 'ユーザーがログインしていない場合' do
  #     it '一覧画面に遷移できない' do
  #       visit items_path
  #       expect(current_path).to eq('/users/sign_in')
  #     end
  #     it '編集画面に遷移できない' do
  #       visit edit_item_path(item.id)
  #       expect(current_path).to eq('/users/sign_in')
  #     end
  #   end
  # end
end