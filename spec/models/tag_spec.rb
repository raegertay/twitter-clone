require 'rails_helper'

RSpec.describe Tag, type: :model do

  let(:subject)  { create(:tag) }

  it { is_expected.to have_many(:tweet_tags).dependent(:destroy) }
  it { is_expected.to have_many(:tweets) }
  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_uniqueness_of(:body) }

end
