require 'rails_helper'

RSpec.describe StudentsController, :type => :controller do

  context 'GET #index' do
    let(:student_one) { create(:student) }
    let(:student_two) { create(:student) }
    let(:students) { [student_one, student_two] }

    it 'render index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'show list of students' do
      get :index
      expect(assigns(:students)).to match_array(students)
    end
  end

  context 'GET #show' do
    subject(:student) { create(:student) }

    it 'load student' do
      get :show, id: student.id
      expect(assigns(:student)).to eq(student)
    end

    it 'render show template' do
      get :show, id: student.id
      expect(response).to render_template('show')
    end
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

  context 'POST #create' do
    context 'when success' do
      subject(:student) { attributes_for(:student) }

      it 'create new student' do
        expect { post :create, student: student }.to change(Student, :count).by(1)
      end

      it 'redirect to index' do
        post :create, student: student
        expect(response).to redirect_to(students_path)
      end
    end

    context 'when fail' do
      subject(:student) { { name: nil, register_number: '123' } }

      it 'do not create new student' do
        expect { post :create, student: student }.not_to change(Student, :count)
      end

      it 'render new template' do
        post :create, student: student
        expect(response).to render_template('new')
      end
    end
  end

  context 'GET #edit' do
    subject(:student) { create(:student) }

    it 'load student to edit' do
      get :edit, id: student.id
      expect(assigns(:student)).to eq(student)
    end

    it 'render edit template' do
      get :edit, id: student.id
      expect(response).to render_template('edit')
    end
  end

  context 'PUT #update' do
    context 'when success' do
      subject(:student) { create(:student) }

      it 'update student' do
        put :update, id: student.id, student: attributes_for(:student)
        expect(assigns(:student)).to eq(student)
      end

      it 'change information' do
        put :update, id: student.id, student: { name: 'Cezer Marrone' }
        expect(student.reload.name).to eq('Cezer Marrone')
      end

      it 'redirect to show' do
        put :update, id: student.id, student: attributes_for(:student)
        expect(response).to redirect_to(student_path(student))
      end
    end

    context 'when fail' do
      subject(:student) { create(:student, name: 'Luiz Cezer') }

      it 'do not change information' do
        put :update, id: student.id, student: { name: nil }
        expect(student.reload.name).to eq('Luiz Cezer')
      end

      it 'render edit template' do
        put :update, id: student.id, student: { name: nil }
        expect(response).to render_template('edit')
      end
    end
  end

  context 'DELETE #destroy' do
    subject(:student) { create(:student) }

    it 'redirect_to students_path' do
      delete :destroy, id: student.id
      expect(response).to redirect_to(students_path)
    end
  end

end
