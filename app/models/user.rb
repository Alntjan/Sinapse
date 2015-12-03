class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :project_entries
  has_many :ideas
  has_many :resources
  has_many :appliances
  has_many :projects

  has_many :project_friendships
  has_many :projects, through: :project_friendships

  def total_ideas
   ideas.count
  end

  def gravatar_url
    stripped_email = email.strip
    downcased_email = stripped_email.downcase
    hash = Digest::MD5.hexdigest(downcased_email)

    require 'uri'
    default_image = {d: 'https://cdn.shopify.com/s/files/1/0266/9827/files/Gravtar.png'}.to_query
    "http://gravatar.com/avatar/#{hash}?#{default_image}&s=200"
  end

end
