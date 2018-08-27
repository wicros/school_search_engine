class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.bigint :school_id, null: false
      t.bigint :user_id, null: true
      t.integer :location_score, default: 0
      t.integer :environment_score, default: 0
      t.integer :service_score, default: 0
      t.integer :progression_score, default: 0
      t.integer :teaching_score, default: 0
      t.integer :fee_score, default: 0
      t.string :content

      t.timestamps
    end
  end
end
