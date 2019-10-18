class Blog < ApplicationRecord
    has_many :comments, dependent: :destroy
    accepts_nested_attributes_for :comments
    validates :title,:body,:description,:image, presence: true
end
