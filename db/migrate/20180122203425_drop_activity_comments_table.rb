class DropActivityCommentsTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :activity_comments
  end
end
