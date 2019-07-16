class BlogSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :image, :description
end
