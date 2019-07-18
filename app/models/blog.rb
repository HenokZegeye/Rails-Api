class Blog < ApplicationRecord
    has_many :comments, dependent: :destroy
    validates :title,:body,:description,:image, presence: true
end
