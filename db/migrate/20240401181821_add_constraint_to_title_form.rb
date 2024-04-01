class AddConstraintToTitleForm < ActiveRecord::Migration[7.1]
  def change
    change_column_null :forms, :title, false
  end
end
