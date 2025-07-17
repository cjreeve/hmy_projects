class Project < ApplicationRecord
  has_many :comments, dependent: :destroy

  # State machine
  include AASM
  aasm column: 'state' do
    state :draft, initial: true
    state :proceeding
    state :done

    event :proceed do
      transitions from: :draft, to: :proceeding
    end
    event :complete do
      transitions from: :proceeding, to: :done
    end
    event :restart do
      transitions from: :done, to: :draft
    end
  end
end
