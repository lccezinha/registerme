require 'rails_helper'

RSpec.describe Membership, :type => :model do

  context 'associations' do
    it { expect(subject).to belong_to(:student) }
    it { expect(subject).to belong_to(:course) }
  end

end
