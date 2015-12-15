class Idea < ProjectEntry
  belongs_to :user

  state_machine :state, :initial => :pending do
    event :accept do
      transition any => :accepted
    end
  end
end
