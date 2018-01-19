class CreateActivityComments < ActiveRecord::Migration[5.1]
  def change
    create_table :activity_comments do |t|
      t.integer :activity_id
      t.integer :comment_id
    end
  end
end
