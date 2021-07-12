class SlideSerializer < ActiveModel::Serializer
  attributes :id, :weight

  belongs_to :playlist
  belongs_to :content
end
