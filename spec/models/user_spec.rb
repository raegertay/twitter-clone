require 'rails_helper'

RSpec.describe User, type: :model do

  let(:subject) { create(:user) }

  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_uniqueness_of(:username) }
  it { is_expected.to have_many(:tweets).dependent(:destroy) }
  it { is_expected.to have_many(:followings).with_foreign_key(:follower_id).dependent(:destroy) }
  it { is_expected.to have_many(:followees).through(:followings) }
  it { is_expected.to have_many(:inverse_followings).with_foreign_key(:followee_id).dependent(:destroy) }
  it { is_expected.to have_many(:followers).through(:inverse_followings) }


end
