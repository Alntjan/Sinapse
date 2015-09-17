class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :project_entries
  has_many :ideas
  has_many :resources
  has_many :appliances
  has_many :projects, through: :project_entries

  def total_ideas
   ideas.count
  end

end
