# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Forms', type: :request do
  describe 'GET /index' do
    it 'returns the index forms page' do
      get forms_url

      expect(response).to render_template(:index)
    end
  end

  describe 'GET /new' do
    it 'returns the new form page' do
      get new_form_url

      expect(response).to render_template(:new)
    end
  end

  describe 'GET /edit' do
    context 'when the form is found' do
      let(:form) { create(:form) }

      it 'returns the edit form page' do
        get edit_form_url(form)

        expect(response).to render_template(:edit)
      end
    end

    context 'when the form is not found' do
      it 'redirects to the root page' do
        get edit_form_url(0)

        expect(response).to redirect_to(root_url)
      end
    end
  end

  describe 'GET /show' do
    context 'when the form is found' do
      let(:form) { create(:form) }

      it 'returns the show form page' do
        get form_url(form)

        expect(response).to render_template(:show)
      end
    end

    context 'when the form is not found' do
      it 'redirects to the root page' do
        get form_url(0)

        expect(response).to redirect_to(root_url)
      end
    end
  end

  describe 'POST /create' do
    context 'when the params are valid' do
      let(:form) { build(:form, title: 'my form') }

      it 'stores the form' do
        expect do
          post forms_url(form: { title: form.title })
        end.to change(Form, :count).by(1)
      end

      it 'redirects to the root page' do
        post forms_url(form: { title: form.title })

        expect(response).to redirect_to(root_url)
      end
    end

    context 'when the params are invalid' do
      let(:form) { build(:form, title: '') }

      it 'does not change the form count' do
        expect do
          post forms_url(form: { title: form.title })
        end.not_to change(Form, :count)
      end

      it 'renders the new form page' do
        post forms_url(form: { title: form.title })

        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PATCH /update' do
    let(:form) { create(:form, title: 'my form') }
    let(:valid_params) do
      { title: 'new title' }
    end
    let(:invalid_params) do
      { title: '' }
    end

    context 'when the user is not found' do
      it 'redirects to the root page' do
        patch form_url(0)

        expect(response).to redirect_to(root_url)
      end
    end

    context 'when the params are valid' do
      it 'updates the form' do
        patch form_url(form), params: { form: valid_params }
        form.reload

        expect(form.title).to eq('new title')
      end

      it 'redirects to the root page' do
        patch form_url(form), params: { form: valid_params }

        expect(response).to redirect_to(root_url)
      end
    end

    context 'when the params are invalid' do
      it 'does not update the form' do
        patch form_url(form), params: { form: invalid_params }
        form.reload

        expect(form.title).to eq('my form')
      end

      it 'renders the edit form page' do
        patch form_url(form), params: { form: invalid_params }

        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE /destroy' do
    context 'when the form is found' do
      let(:form) { create(:form) }

      it 'deletes the form' do
        expect do
          delete form_url(form)
        end.to change { Form.where(title: form.title).count }.by(-1)
      end

      it 'redirects to the root page' do
        delete form_url(form)

        expect(response).to redirect_to(root_url)
      end
    end

    context 'when the form is not found' do
      it 'does not delete any form' do
        expect do
          delete form_url(0)
        end.not_to change(Form, :count)
      end
    end
  end
end
