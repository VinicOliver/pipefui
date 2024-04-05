# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'index form', type: :feature do
  it 'show the title' do
    visit forms_path

    expect(page).to have_content('All Forms')
  end

  it 'clicks the button new form' do
    visit forms_path

    click_on 'New Form'

    expect(page).to have_current_path(new_form_path)
  end

  describe 'when there are no form' do
    it 'display a message that there are none form' do
      visit forms_path

      expect(page).to have_content('No forms registered')
    end
  end
end
