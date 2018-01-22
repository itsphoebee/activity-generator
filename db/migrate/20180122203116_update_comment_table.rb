class UpdateCommentTable < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :activity_id, :integer
  end
end
