class UniversitysController < ApplicationController
  DEPARTMENT_TYPE = "1"

  def index
    @search_type = params[:search_type] || "0"
    @universities = if params[:search_type] == DEPARTMENT_TYPE
                      params[:search_text].blank? ? UniversityDepartment.all : UniversityDepartment.where("name like ?", "%#{params[:text]}%")
                    else
                      params[:search_text].blank? ? UniversityName.all : UniversityName.where("name like ?", "%#{params[:text]}%")
                    end
  end

  def show
    @university_list = params[:search_type] == DEPARTMENT_TYPE ? UniversityScore.where(department_id: params[:id]) : UniversityScore.where(university_id: params[:id])
  end

end

