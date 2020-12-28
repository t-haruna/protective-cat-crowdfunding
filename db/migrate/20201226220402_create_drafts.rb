class CreateDrafts < ActiveRecord::Migration[6.0]
  def change
    create_table :drafts do |t|
      t.references :user,  foreign_key: true, null: false
      t.references :project,  foreign_key: true, null: false

      t.timestamps
    end
  end
end
