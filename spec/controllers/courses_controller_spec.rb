require 'rails_helper'

RSpec.describe CoursesController, :type => :controller do

  context 'GET #index' do
    let(:course_one) { create(:course) }
    let(:course_two) { create(:course) }
    let(:courses) { [course_one, course_two] }

    it 'render index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'show list of courses' do
      get :index
      expect(assigns(:courses)).to match_array(courses)
    end
  end

  context 'GET #show' do
    subject(:course) { create(:course) }

    it 'load course' do
      get :show, id: course.id
      expect(assigns(:course)).to eq(course)
    end

    it 'render show template' do
      get :show, id: course.id
      expect(response).to render_template('show')
    end
  end

  context 'GET #new' do
    it 'render new template' do
      get :new
      expect(response).to render_template('new')
    end

    it 'assign new course instance' do
      get :new
      expect(assigns(:course)).to be_a_new(Course)
    end
  end

  context 'POST #create' do
    context 'when success' do
      subject(:course) { attributes_for(:course) }

      it 'create new course' do
        expect { post :create, course: course }.to change(Course, :count).by(1)
      end

      it 'redirect to index' do
        post :create, course: course
        expect(response).to redirect_to(courses_path)
      end
    end

    context 'when fail' do
      subject(:course) { { name: nil, register_number: '123' } }

      it 'do not create new course' do
        expect { post :create, course: course }.not_to change(Course, :count)
      end

      it 'render new template' do
        post :create, course: course
        expect(response).to render_template('new')
      end
    end
  end

  context 'GET #edit' do
    subject(:course) { create(:course) }

    it 'load course to edit' do
      get :edit, id: course.id
      expect(assigns(:course)).to eq(course)
    end

    it 'render edit template' do
      get :edit, id: course.id
      expect(response).to render_template('edit')
    end
  end

  context 'PUT #update' do
    context 'when success' do
      subject(:course) { create(:course) }

      it 'update course' do
        put :update, id: course.id, course: attributes_for(:course)
        expect(assigns(:course)).to eq(course)
      end

      it 'change information' do
        put :update, id: course.id, course: { name: 'Curso de Ruby' }
        expect(course.reload.name).to eq('Curso de Ruby')
      end

      it 'redirect to show' do
        put :update, id: course.id, course: attributes_for(:course)
        expect(response).to redirect_to(course_path(course))
      end
    end

    context 'when fail' do
      subject(:course) { create(:course, name: 'Curso de Ruby') }

      it 'do not change information' do
        put :update, id: course.id, course: { name: nil }
        expect(course.reload.name).to eq('Curso de Ruby')
      end

      it 'render edit template' do
        put :update, id: course.id, course: { name: nil }
        expect(response).to render_template('edit')
      end
    end
  end

  context 'DELETE #destroy' do
    subject(:course) { create(:course) }

    it 'redirect_to courses_path' do
      delete :destroy, id: course.id
      expect(response).to redirect_to(courses_path)
    end
  end

end
