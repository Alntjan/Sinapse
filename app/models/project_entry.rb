class ProjectEntry < ActiveRecord::Base
  belongs_to :project

  scope :type, -> (type) { where type: type }
end
