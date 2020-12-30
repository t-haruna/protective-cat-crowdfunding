class CreateBillings < ActiveRecord::Migration[6.0]
  def change
    create_table :billings do |t|
      t.integer :count_1
      t.integer :count_2 
      t.integer :count_3
      t.references :user,  foreign_key: true, null: false
      t.references :project,  foreign_key: true, null: false
      t.timestamps
    end
  end
end
