class CreateTableSchool < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.integer :school_id
      t.string :name
      t.string :zip_code
      t.string :address
      t.string :fax
      t.string :tel
      t.string :home_page
      t.string :email
      t.text :direction
      t.string :representative # 担当者
      t.string :establisher # 设立者
      t.string :principal # 校长
      t.date :start_date # 创校时间
      t.date :validity_date_start # 認定期間
      t.date :validity_date_end # 認定期間
      t.integer :teacher_mun
      t.integer :capacity
      t.integer :accommodation # 学生宿舎价格/月
      t.string :admission
      t.string :selection
      t.decimal :latitude, precision: 16, scale: 14
      t.decimal :longitude, precision: 17, scale: 14
      t.string :img_url
      t.text :description
      t.integer :prefecture_id
      t.integer :city_id

      t.timestamps
    end

    add_index :schools, :school_id
  end
end
