require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  let(:user) { create(:user_with_tweets) }
  before { sign_in user }

  describe 'GET #home' do
    let!(:user2) { create(:user_with_tweets) }
    before do
      user.follow(user2)
      get :home
    end
    it { expect(assigns(:tweets).count).to eq(10) }
  end

  describe 'GET #tweets' do
    before { get :tweets, params: { id: user.id } }
    it { expect(assigns(:tweets).count).to eq(5) }
  end

  describe 'GET #following' do
    let!(:user2) { create(:user) }
    before do
      user.follow(user2)
      get :following, params: { id: user.id }
    end
    it { expect(assigns(:followees).count).to eq(1) }
  end

  describe 'GET #follower' do
    let!(:user2) { create(:user) }
    before do
      user2.follow(user)
      get :follower, params: { id: user.id }
    end
    it { expect(assigns(:followers).count).to eq(1) }
  end

end
