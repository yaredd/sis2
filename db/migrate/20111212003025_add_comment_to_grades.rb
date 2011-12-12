class AddCommentToGrades < ActiveRecord::Migration
  def change
    add_column :grades, :comment, :text
  end
end
