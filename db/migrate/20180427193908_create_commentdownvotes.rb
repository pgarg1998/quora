class CreateCommentdownvotes < ActiveRecord::Migration
  def change
    create_table :commentdownvotes do |t|
      t.references :user, index: true, foreign_key: true
      t.references :messagecomment, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
