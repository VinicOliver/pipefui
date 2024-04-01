class Field < ApplicationRecord
  enum type: {
    short_text: 0,
    long_text: 1
  }

  belongs_to :form
end
