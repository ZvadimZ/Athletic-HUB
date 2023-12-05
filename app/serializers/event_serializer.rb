class EventSerializer < ActiveModel::Serializer
    attributes :id, :title, :placeUrl, :time, :count_members, :user_id, :text

    attribute :is_open do
      Time.current.before?(object.registration_close_time)
    end
end