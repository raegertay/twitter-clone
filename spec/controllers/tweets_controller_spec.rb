require 'rails_helper'

RSpec.describe TweetsController, type: :controller do

  let(:user) { create(:user) }
  before { sign_in user }

  describe 'POST #create' do
    before do
      post :create, params: { tweet: { body: "#test #test2 test" } }, format: :js
    end
    it { expect(assigns(:user).tweets.count).to eq(1)  }
    it { expect(assigns(:tweet).tags.count).to eq(2) }
  end

  describe 'DELETE #destroy' do
    let(:tweet) { create(:tweet) }
    before { delete :destroy, params: { id: tweet.id } }
    it { expect(assigns(:tweet)).to be_destroyed }
    it { is_expected.to redirect_to(root_path) }
  end

end
