require 'rails_helper'

RSpec.describe Course, :type => :model do

  context 'validations' do
    context 'presence of'  do
      it { expect(subject).to validate_presence_of(:name) }
      it { expect(subject).to validate_presence_of(:description) }
    end
  end

  context 'associations'

end
