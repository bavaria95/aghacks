class AddApplyIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :apply_id, :inetger
  end
end
