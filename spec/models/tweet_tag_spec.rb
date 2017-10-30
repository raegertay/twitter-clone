require 'rails_helper'

RSpec.describe TweetTag, type: :model do

  it { is_expected.to belong_to(:tweet) }
  it { is_expected.to belong_to(:tag) }

end
