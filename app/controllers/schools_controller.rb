class SchoolsController < ApplicationController

  def index
    @prefecture = Prefecture.all.order(:code)
  end

  def index_data
    data = if params[:text].present? && params[:prefecture].present?
             School.where("name like ? and prefecture_id = ?","%#{params[:text]}%",params[:prefecture]).order(:created_at)
           elsif params[:text].present?
             School.where("name like ?","%#{params[:text]}%").order(:created_at)
           elsif params[:prefecture].present?
             School.where("prefecture_id = ?",params[:prefecture]).order(:created_at)
           else
             School.all.order(:created_at)
           end
    render json: {school_data: data.to_json}
  end

  def show
    @school = School.find(params[:id])
  end

  def show_data
    school = School.find(params[:id])
    render json: {
        graduate_results: school.graduate_results.order(:date).to_json,
        jpt_results: school.jpt_results.order(date: :desc).to_json,
        # eju_results: school.eju_results.order(:date).to_json,
        courses: school.courses.order(:created_at).to_json,
        students: school.student_froms.order(:created_at).to_json
    }
  end

end

