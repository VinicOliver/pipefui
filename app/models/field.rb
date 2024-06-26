# frozen_string_literal: true

class Field < ApplicationRecord
  enum :data_type, {
    short_text: 0,
    long_text: 1
  }, validate: true

  belongs_to :form
end
