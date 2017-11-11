ActiveAdmin.register School do
  permit_params :school_id, :name ,:zip_code, :address, :fax, :tel, :home_page, :email, :direction, :representative,
                :principal, :start_date, :validity_date_start, :validity_date_end, :teacher_mun, :capacity,
                :accommodation, :admission, :selection, :latitude, :longitude, :img_url, :description,
                :prefecture_id, :city_id, :establisher

  index do
    selectable_column
    id_column
    column "学校名称", :name
    column "所在地", :address
    column "電話番号", :tel
    column "URL", :home_page
    actions
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :name, :label => "学校名称", :required => true
      f.input :zip_code, :label => "郵便番号"
      f.input :address, :label => "所在地"
      f.input :fax, :label => "FAX番号"
      f.input :tel, :label => "電話番号"
      f.input :home_page, :label => "URL"
      f.input :email, :label => "E-Mail"
      f.input :direction, :label => "最寄駅からの道順"
      f.input :establisher, :label => "設置者名	"
      f.input :representative, :label => "代表者名"
      f.input :principal, :label => "校長名"
      f.input :start_date, :label => "教育開始年月日", start_year: 1900
      f.input :validity_date_start, :label => "認定期間(开始)", start_year: 1900
      f.input :validity_date_end, :label => "認定期間(结束)", end_year: Time.now.year + 50
      f.input :teacher_mun, :label => "教員数"
      f.input :capacity, :label => "収容定員"
      f.input :accommodation, :label => "学生宿舎价格/月"
      f.input :admission, :label => "入学資格"
      f.input :selection, :label => "入学選抜方法"
      f.input :img_url, :label => "学校图片"
      f.input :description, :label => "学校简介"
      f.input :latitude, :label => "纬度"
      f.input :longitude, :label => "经度"
      f.input :prefecture_id, :label => "都(县)", :as => :select, :collection => Prefecture.all
      # f.input :city_id, :label => "市(区)", :as => :select, :collection => City.all
    end
    f.actions
  end

end
