require 'rails_helper'

RSpec.describe StudentsController, :type => :controller do

  context 'GET #index' do
    it 'render index template' do
      get :index
      expect(response).to render_template('index')
    end

    xit 'show list of students'
  end

  context 'GET #new' do
    it 'render new template' do
      get :new
      expect(response).to render_template('new')
    end

    it 'assign new student instance' do
      get :new
      expect(assigns(:student)).to be_a_new(Student)
    end
  end

end
