class AddSkillsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :skills, :text
  end
end
