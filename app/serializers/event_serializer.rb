class EventSerializer < ActiveModel::Serializer
    attributes :id, :title, :placeUrl, :time, :count_members, :user_id, :text

    attribute :is_open do
      if object.registration_close_time.present? && object.registration_start_time
        Time.current.before?(object.registration_close_time) &&
          Time.current.after?(object.registration_start_time)
      else
        false
      end
    end
end