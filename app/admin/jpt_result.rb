ActiveAdmin.register JptResult do
  permit_params :school_id, :level ,:date, :examinees, :certified

  form do |f|
    f.semantic_errors
    f.object.date = "2016-01-01".to_date if f.object.date.blank?
    f.object.examinees = 0 if f.object.examinees.blank?
    f.object.certified = 0 if f.object.certified.blank?
    f.inputs do
      f.input :school_id, :label => "学校", :as => :select, :collection => School.all.order(id: :desc), :required => true,include_blank: false
      f.input :level, :label => "等级", :as => :select, :collection => JptLevel.all, :required => true
      f.input :date, :label => "日期", :required => true, start_year: 2000
      f.input :examinees, :label => "受験者数"
      f.input :certified, :label => "認定者数"
    end
    f.actions
  end

end
