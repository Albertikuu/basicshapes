class Page < ApplicationRecord
belongs_to :category
has_many :versions
has_many :commits

validates_presence_of :slug
#validates uniqueness of slug within category.pages


end
