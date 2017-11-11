class CreateGraduateResult < ActiveRecord::Migration[5.1]
  def change
    create_table :graduate_results do |t|
      t.integer :school_id
      t.date :date
      t.integer :graduate_school
      t.integer :university
      t.integer :junior_college
      t.integer :technical_school
      t.integer :special_training
      t.integer :traning_school
      t.integer :other

      t.timestamps
    end

    add_index :graduate_results, :school_id
    add_index :graduate_results, :date
  end
end
