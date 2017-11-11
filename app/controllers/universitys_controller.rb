class UniversitysController < ApplicationController

  def index; end

  def index_data
    data = if params[:type] == "0"
             params[:text] == "all" ? UniversityName.all : UniversityName.where("name like ?","%#{params[:text]}%")
           else
             params[:text] == "all" ? UniversityDepartment.all : UniversityDepartment.where("name like ?","%#{params[:text]}%")
           end
    render json: {data: data.to_json}
  end

  def show
    @university_list = params[:type] == "0" ? UniversityScore.where(university_id: params[:id]) : UniversityScore.where(department_id: params[:id])
  end

end

