class Project < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :project_logs, dependent: :destroy

  # State machine
  include AASM
  aasm column: 'state' do
    state :draft, initial: true
    state :proceeding
    state :done

    event :proceed do
      transitions from: :draft, to: :proceeding
      after do
        project_logs.create!(action: 'state_changed', field: 'state', from_value: 'draft', to_value: 'proceeding')
      end
    end
    event :complete do
      transitions from: :proceeding, to: :done
      after do
        project_logs.create!(action: 'state_changed', field: 'state', from_value: 'proceeding', to_value: 'done')
      end
    end
    event :restart do
      transitions from: :done, to: :proceeding
      after do
        project_logs.create!(action: 'state_changed', field: 'state', from_value: 'done', to_value: 'proceeding')
      end
    end
  end

  after_update :log_attribute_changes

  private

  def log_attribute_changes
    %w[title description manager_name].each do |attr|
      if saved_change_to_attribute?(attr)
        project_logs.create!(action: 'attribute_changed', field: attr, from_value: saved_change_to_attribute(attr)[0], to_value: saved_change_to_attribute(attr)[1])
      end
    end
  end
end
