require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:user) { create(:user) }
  before { sign_in user }

  describe 'PUT #update_avatar' do
     before { put :update_avatar, params: { avatar_url: 'https://cdn.filestackcontent.com/by39AaH3SGulOErjJtNQ' } }
     it { is_expected.to use_before_action(:prepare_user) }
     it { expect(assigns(:user)).to have_attributes(avatar_url: 'https://cdn.filestackcontent.com/by39AaH3SGulOErjJtNQ' )  }
     it { is_expected.to set_flash[:notice] }
     it { is_expected.to redirect_to(root_path) }
  end

  describe 'POST #follow' do
    let(:user_2) { create(:user) }
    before do
      post :follow, params: { id: user_2.id }
    end
    it { is_expected.to use_before_action(:prepare_user) }
    it { is_expected.to use_before_action(:prepare_followee) }
    it { expect(assigns(:user).followees.count).to eq(1) }
    it { is_expected.to set_flash[:notice] }
    it { is_expected.to redirect_to(root_path) }
  end

  describe 'DELETE #unfollow' do
    let(:user_2) { create(:user) }
    before do
      user.follow(user_2)
      delete :unfollow, params: { id: user_2.id }
    end
    it { is_expected.to use_before_action(:prepare_user) }
    it { is_expected.to use_before_action(:prepare_followee) }
    it { expect(assigns(:user).followees.count).to eq(0) }
    it { is_expected.to set_flash[:notice] }
    it { is_expected.to redirect_to(root_path) }
  end

end
