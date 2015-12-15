class Project < ActiveRecord::Base
  has_many :project_entries, :dependent => :destroy
  has_many :ideas
  has_many :resources
  has_many :appliances

  has_many :accepted_project_entries,
            -> { where project_entries: { state: "accepted" } },
            through: :project_entries,
            source: :project
  has_many :accepted_ideas,
            -> { where project_entries: { state: "accepted", type: "Idea" } },
            through: :project_entries,
            source: :project
  has_many :accepted_resources,
            -> { where project_entries: { state: "accepted", type: "Resource" } },
            through: :project_entries,
            source: :project
  has_many :accepted_appliances,
            -> { where project_entries: { state: "accepted", type: "Appliance" } },
            through: :project_entries,
            source: :project

  has_many :users, through: :ideas
  has_many :users, through: :resources
  has_many :users, through: :appliances

  has_many :project_friendships
  has_many :pending_project_friendships,
            -> { where project_friendships: { state: "pending" } },
            through: :project_friendships,
            source: :project
  has_many :accepted_project_friendships,
            -> { where project_friendships: { state: "accepted" } },
            through: :project_friendships,
            source: :project

  has_many :users, through: :project_friendships

  belongs_to :user

  state_machine :state, :initial => :opened do
    event :close do
      transition any => :closed
    end
    event :open do
      transition any => :opened
    end
    event :ready do
      transition any => :ready
    end
  end

  validates :title, presence: :true, length: {minimum: 3}, uniqueness: true

  def has_ideas?
    if ideas.count > 0
      true
    else
      false
    end
  end

  def has_resources?
    if resources.count > 0
      true
    else
      false
    end
  end

  def has_appliances?
    if appliances.count > 0
      true
    else
      false
    end
  end

  def has_accepted_ideas?
    if accepted_ideas.count > 0
      true
    else
      false
    end
  end

  def has_accepted_resources?
    if accepted_resources.count > 0
      true
    else
      false
    end
  end

  def has_accepted_appliances?
    if accepted_appliances.count > 0
      true
    else
      false
    end
  end

  def has_percentage?
    i = 0;
    if ideas.count > 0
      i = i + 33.3;
    end
    if resources.count > 0
      i = i + 33.3;
    end
    if appliances.count > 0
      i = i + 33.3;
    end
    return i.round(0);
  end

  def has_accepted_percentage?
    i = 0;
    if accepted_ideas.count > 0
      i = i + 33.3;
    end
    if accepted_resources.count > 0
      i = i + 33.3;
    end
    if accepted_appliances.count > 0
      i = i + 33.3;
    end
    return i.round(0);
  end

  def accepted_entry_types
    i = [];
    if has_accepted_ideas?
      i << "Ideias"
    end
    if has_accepted_resources?
      i << "Recursos"
    end
    if has_accepted_appliances?
      i << "Candidaturas"
    end
    return i;
  end

  def missing_entry_types
    i = [];
    if !has_accepted_ideas?
      i << "Ideia"
    end
    if !has_accepted_resources?
      i << "Recurso"
    end
    if !has_accepted_appliances?
      i << "Candidatura"
    end
    return i;
  end


end
