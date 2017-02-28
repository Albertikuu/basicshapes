class Page < ApplicationRecord
belongs_to :category
has_many :commits

validates_presence_of :title
#validates uniqueness of name within category.pages


end
