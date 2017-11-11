ActiveAdmin.register GraduateResult do

  permit_params :school_id, :date , :graduate_school, :universitys, :junior_college, :technical_school,
                :special_training, :traning_school, :other, :graduate_num

  form do |f|
    f.semantic_errors
    f.object.date = "2016-01-01".to_date if f.object.date.blank?
    f.object.graduate_num = 0 if f.object.graduate_num.blank?
    f.object.graduate_school = 0 if f.object.graduate_school.blank?
    f.object.university = 0 if f.object.university.blank?
    f.object.junior_college = 0 if f.object.junior_college.blank?
    f.object.technical_school = 0 if f.object.technical_school.blank?
    f.object.special_training = 0 if f.object.special_training.blank?
    f.object.traning_school = 0 if f.object.traning_school.blank?
    f.object.other = 0 if f.object.other.blank?
    f.inputs do
      f.input :school_id, :label => "学校", :as => :select, :collection => School.all.order(id: :desc), :required => true,include_blank: false
      f.input :date, :label => "日期", :required => true, start_year: 2000
      f.input :graduate_num, :label => "卒業者数"
      f.input :graduate_school, :label => "大学院"
      f.input :universitys, :label => "大学"
      f.input :junior_college, :label => "短期大学"
      f.input :technical_school, :label => "高等専門学校"
      f.input :special_training, :label => "専修学校"
      f.input :traning_school, :label => "各種学校"
      f.input :other, :label => "その他"
    end
    f.actions
  end

end
