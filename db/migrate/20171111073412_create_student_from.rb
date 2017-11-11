class CreateStudentFrom < ActiveRecord::Migration[5.1]
  def change
    create_table :student_froms do |t|
      t.integer :school_id
      t.string :from
      t.integer :num

      t.timestamps
    end

    add_index :student_froms, :school_id
    add_index :student_froms, :num
  end
end
