# frozen_string_literal: true

class Response < ApplicationRecord
  belongs_to :field
  belongs_to :form
end
