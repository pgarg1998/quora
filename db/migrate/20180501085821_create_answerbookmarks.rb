class CreateAnswerbookmarks < ActiveRecord::Migration
  def change
    create_table :answerbookmarks do |t|
      t.references :user, index: true, foreign_key: true
      t.references :answers, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
