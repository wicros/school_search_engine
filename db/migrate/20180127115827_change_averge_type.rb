class ChangeAvergeType < ActiveRecord::Migration[5.1]
  def change
    change_column :college_scores, :average, :decimal
    change_column :college_scores, :median, :decimal
  end
end
