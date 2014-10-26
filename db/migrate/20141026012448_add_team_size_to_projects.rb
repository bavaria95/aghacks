class AddTeamSizeToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :team_size, :integer, default: 1
  end
end
