class RemoveNotNeededAttributesFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :leader
    remove_column :projects, :short_description
    remove_column :projects, :weight
    remove_column :projects, :dislikes
    remove_column :projects, :likes
    remove_column :projects, :type_id
  end
end
