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

end
