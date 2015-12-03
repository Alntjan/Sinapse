class Project < ActiveRecord::Base
  has_many :project_entries, :dependent => :destroy
  has_many :ideas
  has_many :resources
  has_many :appliances
  has_many :users, through: :ideas
  has_many :users, through: :resources
  has_many :users, through: :appliances

  has_many :project_friendships
  has_many :users, through: :project_friendships

  belongs_to :user

  validates :title, presence: :true, length: {minimum: 3}, uniqueness: true
end
