class School < ApplicationRecord
  has_many :student_froms, dependent: :destroy
  has_many :courses, dependent: :destroy
  has_many :jpt_results, dependent: :destroy
  has_many :eju_results, dependent: :destroy
  has_many :graduate_results, dependent: :destroy
  has_many :comments

  belongs_to :prefecture

  has_attached_file :img_url, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :img_url, content_type: /\Aimage\/.*\z/

  scope :search_with, ->(text:, prefecture:) do
    schools = if text.present? && prefecture > 0
                where("name like ? and prefecture_id = ?", "%#{text}%", prefecture).order(:created_at)
              elsif text.present?
                where("name like ?", "%#{text}%").order(:created_at)
              elsif prefecture > 0
                where("prefecture_id = ?", prefecture).order(:created_at)
              else
                all
              end
    schools.where(id: %w[125 127 140 159 129 10 9 13 183 215 275 34 42 67 165 44 238 6])
  end
end

