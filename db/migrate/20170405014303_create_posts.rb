class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :rationale
      t.date :date

      t.timestamps null: false
    end
  end
end
