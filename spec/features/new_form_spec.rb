# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'New form', type: :feature do
  describe 'when the page is loaded' do
    it 'renders the content' do
      visit new_form_path

      aggregate_failures do
        expect(page).to have_content('New Form')
        expect(find_field(id: 'form_title'))
        expect(page).to have_button('Create form')
        expect(find_link('Back'))
      end
    end
  end

  describe 'with valid info' do
    it 'creates a new form' do
      visit new_form_path

      fill_in 'Title', with: 'My Form'
      select('short_text', from: 'Data type')
      fill_in 'Label', with: 'Name'

      click_on 'Create form'

      expect(page).to have_current_path(root_path)
    end
  end

  describe 'when inputs are blank' do
    it 'renders to the new form page' do
      visit new_form_path

      click_on 'Create form'

      expect(page).to have_current_path(new_form_path)
    end
  end
end
