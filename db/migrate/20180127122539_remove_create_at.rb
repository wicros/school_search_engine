class RemoveCreateAt < ActiveRecord::Migration[5.1]
  def change
    remove_column :college_scores, :created_at
    remove_column :college_scores, :updated_at
  end
end
