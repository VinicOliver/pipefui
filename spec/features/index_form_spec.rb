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
end
