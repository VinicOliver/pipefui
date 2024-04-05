# frozen_string_literal: true

FactoryBot.define do
  factory :response do
    value { FFaker::FreedomIpsum.phrases }

    field
    form
  end
end
