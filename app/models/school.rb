class School < ApplicationRecord
  has_many :student_froms, dependent: :destroy
  has_many :courses, dependent: :destroy
  has_many :jpt_results, dependent: :destroy
  has_many :eju_results, dependent: :destroy
  has_many :graduate_results, dependent: :destroy

  belongs_to :prefecture

  has_attached_file :img_url, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :img_url, content_type: /\Aimage\/.*\z/
end
