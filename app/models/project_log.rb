class ProjectLog < ApplicationRecord
  belongs_to :project

  validates :action, presence: true
  validates :project_id, presence: true
end
