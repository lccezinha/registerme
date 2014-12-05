require 'rails_helper'

RSpec.describe Course, :type => :model do

  context 'validations' do
    context 'presence of'  do
      it { expect(subject).to validate_presence_of(:name) }
      it { expect(subject).to validate_presence_of(:description) }
    end
  end

  context 'associations' do
    it { expect(subject).to have_many(:memberships) }
    it { expect(subject).to have_many(:students).through(:memberships) }
  end

end
