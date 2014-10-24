class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :leader
      t.integer :type_id
      t.text :team
      t.text :short_description
      t.text :long_description
      t.integer :likes
      t.integer :dislikes
      t.float :weight

      t.timestamps
    end
  end
end
