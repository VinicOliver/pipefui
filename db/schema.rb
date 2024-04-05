# frozen_string_literal: true

ActiveRecord::Schema[7.1].define(version: 20_240_401_181_821) do # rubocop:disable Metrics/BlockLength
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'fields', force: :cascade do |t|
    t.integer 'data_type', default: 0
    t.string 'label', default: ''
    t.boolean 'required'
    t.bigint 'form_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['form_id'], name: 'index_fields_on_form_id'
  end

  create_table 'forms', force: :cascade do |t|
    t.string 'title', null: false
    t.boolean 'can_answer', default: true
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'responses', force: :cascade do |t|
    t.text 'value', default: ''
    t.bigint 'field_id', null: false
    t.bigint 'form_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['field_id'], name: 'index_responses_on_field_id'
    t.index ['form_id'], name: 'index_responses_on_form_id'
  end

  add_foreign_key 'fields', 'forms'
  add_foreign_key 'responses', 'fields'
  add_foreign_key 'responses', 'forms'
end
