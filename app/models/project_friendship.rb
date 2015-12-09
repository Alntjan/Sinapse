class ProjectFriendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  state_machine :state, :initial => :pending do
    event :accept do
      transition any => :accepted
    end
  end

end
