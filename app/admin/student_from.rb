ActiveAdmin.register StudentFrom do

  permit_params :school_id, :from ,:num

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :school_id, :label => "学校", :as => :select, :collection => School.all.order(id: :desc), :required => true,include_blank: false
      f.input :from, :label => "出身国", :required => true
      f.input :num, :label => "人数", :required => true
    end
    f.actions
  end

end
