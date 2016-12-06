class Appliance < ProjectEntry
  include PublicActivity::Model
  tracked

  belongs_to :user

  state_machine :state, :initial => :pending do
    event :accept do
      transition any => :accepted
    end
  end

  validates_uniqueness_of :user_id, scope: :project_id, message: "Já te candidataste a este projecto!"

end
