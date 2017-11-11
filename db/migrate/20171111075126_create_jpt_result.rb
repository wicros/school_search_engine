class CreateJptResult < ActiveRecord::Migration[5.1]
  def change
    create_table :jpt_results do |t|
      t.integer :school_id
      t.string :level
      t.date :date
      t.integer :examinees
      t.integer :certified

      t.timestamps
    end

    add_index :jpt_results, :school_id
    add_index :jpt_results, :date
  end
end
