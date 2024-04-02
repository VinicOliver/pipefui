# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Form, type: :model do
  describe 'validates' do
    it { is_expected.to validate_presence_of(:title) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:fields) }
    it { is_expected.to have_many(:responses) }
  end
end
