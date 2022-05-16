class RemoveColumnsFromMemos < ActiveRecord::Migration[6.1]
  def change
    remove_column :memos, :descriotion, :text
  end
end
