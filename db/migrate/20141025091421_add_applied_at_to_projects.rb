class AddAppliedAtToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :apply_id, :integer
  end
end
