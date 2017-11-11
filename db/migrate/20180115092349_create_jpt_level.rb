class CreateJptLevel < ActiveRecord::Migration[5.1]
  def change
    create_table :jpt_levels do |t|
      t.string :name
    end
  end
end
