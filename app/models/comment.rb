class Comment < ApplicationRecord
  belongs_to :blog
  validates :name,:comment, presence: true
  
end
