class CreateMemos < ActiveRecord::Migration[6.1]
  def change
    create_table :memos do |t|
      t.string :title
      t.text :descriotion

      t.timestamps
    end
  end
end
