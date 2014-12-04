require 'rails_helper'

RSpec.describe Student, :type => :model do

  context 'validations' do
    context 'presence of'  do
      it { expect(subject).to validate_presence_of(:name) }
      it { expect(subject).to validate_presence_of(:register_number) }
    end

    context 'format of' do
      it { expect(subject).to allow_value('ABC123123').for(:register_number) }
    end
  end

  context 'associations'

end
