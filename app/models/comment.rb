class Comment < ApplicationRecord
  belongs_to :project

  validates :commenter_name, presence: true
  validates :details, presence: true
end
