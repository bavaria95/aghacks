class SetDefaultValuesInProjects < ActiveRecord::Migration
  def change
  	change_column :projects, :likes, :integer, default: 0
  	change_column :projects, :dislikes, :integer, default: 0
  	change_column :projects, :rank, :integer, default: 0

  end
end
