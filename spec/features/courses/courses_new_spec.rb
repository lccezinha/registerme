require 'rails_helper'

RSpec.describe 'Page to add new course', type: :feature do
  feature 'show the page to add new course' do
    scenario 'see the fields' do
      visit new_course_path

      fill_in 'Nome', with: 'TI'
      fill_in 'Descrição do Curso', with: 'TI TI'

      click_button('Criar Curso')

      expect(current_path).to eq(courses_path)
    end
  end
end
