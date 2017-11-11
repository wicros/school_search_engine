class CreateCourse < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.integer :school_id
      t.string :name
      t.string :purpose
      t.string :length
      t.integer :hours
      t.integer :weeks
      t.integer :admission # 入学月份
      t.integer :selection_fee
      t.integer :admission_fee
      t.integer :tuition
      t.integer :other_fee

      t.timestamps
    end

    add_index :courses, :school_id
    add_index :courses, :admission
  end
end
