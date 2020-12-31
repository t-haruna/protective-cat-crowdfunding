class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.references :user,  foreign_key: true, null: false
      t.string :payjp_id, null: false
      t.string :customer_id,    null: false    #これはpayjp_id相当のカラム

      t.timestamps
    end
  end
end
