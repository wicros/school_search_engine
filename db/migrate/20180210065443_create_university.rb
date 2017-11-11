class CreateUniversity < ActiveRecord::Migration[5.1]
  def change
    create_table :university_names do |t|
      t.string :name
    end

    create_table :university_departments do |t|
      t.string :name
    end

    create_table :college_sandboxes do |t|
      t.string :name
      t.string :department
      t.string :total_name
      t.string :prefecture_name
      t.decimal :heat
      t.decimal :difficulty
      t.decimal :acceptance_rate
    end

    create_table :university_scores do |t|
      t.string :name
      t.string :department
      t.string :total_name
      t.string :prefecture_name
      t.decimal :heat
      t.decimal :difficulty
      t.decimal :acceptance_rate
      t.decimal :average
      t.decimal :median
      t.decimal :highest
      t.decimal :lowest
      t.integer :sample_size
      t.integer :university_id
      t.integer :department_id
      t.integer :prefecture_id

      t.date :date
    end
    add_index :university_scores, :university_id
    add_index :university_scores, :department_id
    add_index :university_scores, :prefecture_id

  end
end
