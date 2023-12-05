class EventSerializer < ActiveModel::Serializer
    attributes :id, :title, :placeUrl, :time, :count_members, :user_id, :text

    attribute :is_open do
      Time.current < :registarion_close_time
    end
end