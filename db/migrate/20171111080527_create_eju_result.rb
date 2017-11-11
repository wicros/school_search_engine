class CreateEjuResult < ActiveRecord::Migration[5.1]
  def change
    create_table :eju_results do |t|
      t.integer :school_id
      t.integer :exam_type
      t.date :date
      t.integer :examinees
      t.integer :certified

      t.timestamps
    end

    add_index :eju_results, :school_id
    add_index :eju_results, :date
  end
end
