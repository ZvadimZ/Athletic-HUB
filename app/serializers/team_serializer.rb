class TeamSerializer < ActiveModel::Serializer
    attributes :name, :count_members, :max_count
    
    belongs_to :event
    has_many :users, through: :teamMember

end