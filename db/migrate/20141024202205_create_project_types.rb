class CreateProjectTypes < ActiveRecord::Migration
  def change
    create_table :project_types do |t|
      t.text :type
      t.text :license

      t.timestamps
    end
  end
end
