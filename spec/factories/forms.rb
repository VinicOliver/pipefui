# frozen_string_literal: true

FactoryBot.define do
  factory :form do
    title { 'subscribe form' }
    can_answer { %i[true false].sample }
  end
end
