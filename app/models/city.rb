class City < ApplicationRecord
  belongs_to :prefecture
  has_many :schools
end
