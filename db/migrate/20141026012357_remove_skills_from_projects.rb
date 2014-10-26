class RemoveSkillsFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :skills, :string
  end
end
