class SchoolsController < ApplicationController

  def index
    @prefecture = Prefecture.all.order(:code)
  end

  def index_data
    schools = School.where(id: %w(125 127 140 159 129 10 9 13 183 215 275 34 42 67 165 44 238 6))
    schools = if params[:text].present? && params[:prefecture].present?
                schools.where("name like ? and prefecture_id = ?", "%#{params[:text]}%", params[:prefecture]).order(:created_at)
              elsif params[:text].present?
                schools.where("name like ?", "%#{params[:text]}%").order(:created_at)
              elsif params[:prefecture].present?
                schools.where("prefecture_id = ?", params[:prefecture]).order(:created_at)
              else
                schools
              end
    render json: {school_data: schools.order(:created_at).to_json}
  end

  def show
    @school = School.includes(:comments).find(params[:id])
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

