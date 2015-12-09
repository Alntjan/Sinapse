class Project < ActiveRecord::Base
  has_many :project_entries, :dependent => :destroy
  has_many :ideas
  has_many :resources
  has_many :appliances
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
  end

  validates :title, presence: :true, length: {minimum: 3}, uniqueness: true
end
