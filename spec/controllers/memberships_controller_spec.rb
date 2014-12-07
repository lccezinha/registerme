require 'rails_helper'

RSpec.describe MembershipsController, :type => :controller do

  context 'GET #new' do
    it 'render new template' do
      get :new
      expect(response).to render_template('new')
    end
    it 'assing new membership' do
      get :new
      expect(assigns(:membership)).to be_a_new(Membership)
    end
  end

  context 'POST #create' do
    let(:student) { create(:student) }
    let(:course) { create(:course) }

    context 'when success' do
      it 'create new membership' do
        expect { post :create, membership: { student_id: student.id, course_id: course.id } }.to change(Membership, :count).by(1)
      end

      it 'redirect to root' do
        post :create, membership: { student_id: student.id, course_id: course.id }
        expect(response).to redirect_to(student_path(student))
      end
    end

    context 'when fail' do
      subject(:membership) { { student_id: nil, course_id: 1 } }

      it 'do not create membership' do
        expect { post :create, membership: membership }.not_to change(Membership, :count)
      end
      it 'render new action' do
        post :create, membership: membership
        expect(response).to render_template('new')
      end
    end
  end
end