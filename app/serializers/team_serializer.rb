class TeamSerializer < ActiveModel::Serializer
    attributes :name, :capacity, :max_count
    
    belongs_to :event

    attribute :members do
      @users = object.users
      users_names = Array.new
      @users.each do |u|
        users_names.push(u.name)
      end
      users_names
    end
end