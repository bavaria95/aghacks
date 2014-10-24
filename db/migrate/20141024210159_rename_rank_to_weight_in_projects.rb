class RenameRankToWeightInProjects < ActiveRecord::Migration
  def change
  	rename_column :projects, :rank, :weight
  end
end
