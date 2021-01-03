class CreateExecutes < ActiveRecord::Migration[6.0]
  def change
    create_table :executes do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true
      t.text :execute_title,              null: false
      t.string :execute_image,            null: false
      t.text :execute_text,               null: false
      t.timestamps
    end
  end
end
