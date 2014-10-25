class ChangeSkillInProjects < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.change :skills, :string
    end
  end
  def self.down
    change_table :projects do |t|
      t.change :skills, :text
    end
  end
end
