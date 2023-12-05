class TeamSerializer < ActiveModel::Serializer
    attributes :name, :capacity, :max_count
    
    belongs_to :event
    has_many :teamMembers

    attribute :members do
      @teamMembers = TeamMember.find_by(team_id: :id)
      @teamMembers.user_id
    end
end