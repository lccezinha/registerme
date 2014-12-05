require 'rails_helper'

RSpec.describe Membership, :type => :model do

  context 'presence of' do
    context 'presence of'  do
      it { expect(subject).to validate_presence_of(:student_id) }
      it { expect(subject).to validate_presence_of(:course_id) }
    end
  end

  context 'associations' do
    it { expect(subject).to belong_to(:student) }
    it { expect(subject).to belong_to(:course) }
  end

end
