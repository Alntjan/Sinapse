class ProjectEntry < ActiveRecord::Base
  include PublicActivity::Common
  belongs_to :project

  scope :type, -> (type) { where type: type }
end
