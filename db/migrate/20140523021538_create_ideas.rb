class CreateIdeas < ActiveRecord::Migration
  def up
    create_table :ideas do |t|
      ## Foreign keys
      t.integer     :user_id,  :null => false

      ## Post attributes
      t.string      :description,    :null => false, :limit => 255

      t.timestamps
    end

    add_index :ideas, :user_id
  end

  def down
    drop_table :ideas
  end
end
