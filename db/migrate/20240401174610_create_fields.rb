# frozen_string_literal: true

class CreateFields < ActiveRecord::Migration[7.1]
  def change
    create_table :fields do |t|
      t.integer :data_type, default: 0
      t.string :label, default: ''
      t.boolean :required
      t.references :form, null: false, foreign_key: true

      t.timestamps
    end
  end
end
