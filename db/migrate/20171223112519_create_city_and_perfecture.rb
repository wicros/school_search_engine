class CreateCityAndPerfecture < ActiveRecord::Migration[5.1]
  def change
    create_table :prefectures do |t|
      t.string :name
      t.integer :code
      t.string :name_eng

      t.timestamps
    end

    create_table :cities do |t|
      t.string :name
      t.integer :prefecture_id
      t.integer :code
      t.string :name_eng

      t.timestamps
    end
  end
end
