require 'rails_helper'

RSpec.describe GetApiService, type: :service do

  describe '.call' do

    let!(:uri) { "https://api.github.com/users/raegertay" }
    it { expect(described_class.call(uri)['login']).to eq('raegertay') }
    it { expect(described_class.call(uri)).to be_a(Hash) }

  end

end
