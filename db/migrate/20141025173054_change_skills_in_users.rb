class ChangeSkillsInUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.change :skills, :string
    end
  end
  def self.down
    change_table :users do |t|
      t.change :skills, :text
    end
  end
end
