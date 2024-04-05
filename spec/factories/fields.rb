# frozen_string_literal: true

FactoryBot.define do
  factory :field do
    data_type { %i[short_text long_text].sample }
    label { %w[name city country last_name].sample }
    required { %i[true false].sample }

    form
  end
end
