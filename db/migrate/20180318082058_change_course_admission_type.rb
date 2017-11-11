class ChangeCourseAdmissionType < ActiveRecord::Migration[5.1]
  def change
    change_column :courses, :admission, :string
  end
end
