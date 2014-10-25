class ChangeTeamToCreatorInProjects < ActiveRecord::Migration
  def change
    rename_column :projects, :team, :creator
  end
end
