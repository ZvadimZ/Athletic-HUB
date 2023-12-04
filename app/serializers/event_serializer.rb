class EventSerializer < ActiveModel::Serializer
    attributes :name, :place, :time, :count_members,
        :registration_start_time, :registration_close_time, :description

    has_many :teams
    

end