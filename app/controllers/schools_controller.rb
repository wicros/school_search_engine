class SchoolsController < ApplicationController

  def index
    @prefectures = [['全部', 0]] | Prefecture.all.order(:code).map {|p| [p.name, p.id]}
    @search_prefecture = params[:search_prefecture].to_i || 0
    @schools = School.search_with(text: params[:search_text], prefecture: @search_prefecture)
  end

  def show
    @school = School.includes(:comments).find(params[:id])
  end

  def show_data
    render json: School.find(params[:id]).to_json(include: %i[graduate_results jpt_results courses student_froms eju_results])
  end

end

