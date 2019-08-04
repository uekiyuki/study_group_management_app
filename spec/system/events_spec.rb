require 'rails_helper'

describe '勉強会表示機能', type: :system do
  let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com', uid: 'aaa') }
  let(:user_b) { FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com', uid: 'bbb') }
  let(:user_c) { FactoryBot.create(:user, name: 'ユーザーC', email: 'c@example.com', uid: 'ccc') }
  let(:user_d) { FactoryBot.create(:user, name: 'ユーザーD', email: 'd@example.com', uid: 'ddd') }
  let!(:event_a) { FactoryBot.create(:event, title: 'ユーザAの勉強会', user: user_a) }
  let!(:event_b) { FactoryBot.create(:event, title: 'ユーザBの勉強会', capacity: 2, user: user_b) }

  before do
    visit new_user_session_path
    fill_in 'メールアドレス', with: login_user.email
    fill_in 'パスワード', with: login_user.password
    click_button 'ログイン'
    page.driver.browser.manage.window.resize_to(1024, 768)
  end

  shared_examples_for 'ユーザAの勉強会が表示される' do
    it { expect(page).to have_content 'ユーザAの勉強会' }
  end

  shared_examples_for '参加するが表示されない' do
    it { expect(page).to have_no_content '参加する' }
  end

  describe '勉強会一覧表示' do
    context 'ユーザAがログインしているとき' do
      let(:login_user) { user_a }
      it_behaves_like 'ユーザAの勉強会が表示される'
    end

    context 'ユーザBがログインしているとき' do
      let(:login_user) { user_b }
      it_behaves_like 'ユーザAの勉強会が表示される'
    end

    context 'だれもログインしていないとき' do
      let(:login_user) { user_a }
      it 'ユーザAの勉強会が表示されている' do
        click_on 'ログアウト'
        visit events_path
        expect(page).to have_content 'ユーザAの勉強会'
      end
    end
  end

  describe '勉強会の詳細表示機能' do
    context 'ユーザAがログインしているとき' do
      let(:login_user) { user_a }

      context 'ユーザAの勉強会の詳細画面' do
        before { visit event_path(event_a) }

        it_behaves_like 'ユーザAの勉強会が表示される'
        it_behaves_like '参加するが表示されない'
      end

      context 'ユーザBの勉強会の詳細画面' do
        before { visit event_path(event_b) }

        it 'ユーザBの勉強会が表示されている' do
          expect(page).to have_content 'ユーザBの勉強会'
        end

        it '参加するが表示されている' do
          expect(page).to have_content '参加する'
        end

        context 'ユーザAが勉強会を申し込み済みのとき' do
          it 'キャンセルが表示されている' do
            FactoryBot.create(:participant, user: user_a, event: event_b)
            visit current_path
            expect(page).to have_content 'キャンセルする'
          end
        end

        context '勉強会の定員いっぱいのとき' do
          it '参加できませんと表示されている' do
            FactoryBot.create(:participant, user: user_c, event: event_b)
            FactoryBot.create(:participant, user: user_d, event: event_b)
            visit current_path
            expect(page).to have_content '参加できません'
          end
        end
      end
    end

    context 'ユーザがログインしていないとき' do
      let(:login_user) { user_a }

      before do
        click_on 'ログアウト'
        visit event_path(event_a)
      end

      it_behaves_like 'ユーザAの勉強会が表示される'
      it_behaves_like '参加するが表示されない'
    end
  end
end
