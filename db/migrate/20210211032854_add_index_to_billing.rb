class AddIndexToBilling < ActiveRecord::Migration[6.0]
  def change
    def change
      add_index :billings,  :project
    end
  end
end
