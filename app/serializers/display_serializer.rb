class DisplaySerializer < ActiveModel::Serializer
  attributes :id, :name, :eventId

  belongs_to :playlist

  def eventId
    object.event_id
  end
end
