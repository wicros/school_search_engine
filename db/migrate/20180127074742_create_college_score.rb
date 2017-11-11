class CreateCollegeScore < ActiveRecord::Migration[5.1]
  def change
    create_table :college_scores do |t|
      t.string :name
      t.string :department
      t.integer :average
      t.integer :median
      t.integer :highest
      t.integer :lowest
      t.integer :sample_size

      t.timestamps
    end

    add_index :college_scores, :name
    add_index :college_scores, [:name, :department]
  end
end