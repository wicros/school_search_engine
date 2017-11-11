ActiveAdmin.register Course do

  permit_params :school_id, :name ,:purpose, :length, :hours, :weeks, :admission, :selection_fee,
                :admission_fee, :tuition, :other_fee

  form do |f|
    f.semantic_errors
    f.object.purpose = "進学" if f.object.purpose.blank?
    f.inputs do
      f.input :school_id, :label => "学校", :as => :select, :collection => School.all.order(id: :desc), :required => true,include_blank: false
      f.input :name, :label => "認定コース", :required => true
      f.input :purpose, :label => "目的"
      f.input :length, :label => "修業期間"
      f.input :hours, :label => "授業時数"
      f.input :weeks, :label => "授業週数"
      f.input :admission, :label => "入学時期"
      f.input :selection_fee, :label => "選考料"
      f.input :admission_fee, :label => "入学金"
      f.input :tuition, :label => "授業料"
      f.input :other_fee, :label => "その他"
    end
    f.actions
  end
end
