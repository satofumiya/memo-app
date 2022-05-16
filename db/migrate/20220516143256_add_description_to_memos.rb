class AddDescriptionToMemos < ActiveRecord::Migration[6.1]
  def change
    add_column :memos, :description, :text
  end
end
