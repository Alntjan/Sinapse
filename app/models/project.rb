class Project < ActiveRecord::Base
  has_many :project_entries, :dependent => :destroy
  has_many :ideas
  has_many :resources
  has_many :appliances
  has_many :users, through: :ideas
  has_many :users, through: :resources
  has_many :users, through: :appliances
end
