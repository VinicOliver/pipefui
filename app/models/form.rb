# frozen_string_literal: true

class Form < ApplicationRecord
  validates :title, presence: true

  has_many :fields
  has_many :responses
end
