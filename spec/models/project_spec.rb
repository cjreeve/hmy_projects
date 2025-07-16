require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'AASM state machine' do
    let(:project) { Project.new(title: 'Test', manager_name: 'Manager', state: 'draft') }

    it 'has initial state draft' do
      expect(project.aasm.current_state).to eq(:draft)
    end

    it 'transitions from draft to in_progress with #start!' do
      project.start!
      expect(project.aasm.current_state).to eq(:in_progress)
    end

    it 'transitions from in_progress to in_review with #submit_for_review!' do
      project.state = 'in_progress'
      project.submit_for_review!
      expect(project.aasm.current_state).to eq(:in_review)
    end

    it 'transitions from in_review to complete with #complete!' do
      project.state = 'in_review'
      project.complete!
      expect(project.aasm.current_state).to eq(:complete)
    end

    it 'transitions from complete to in_progress with #reopen!' do
      project.state = 'complete'
      project.reopen!
      expect(project.aasm.current_state).to eq(:in_progress)
    end

    it 'does not allow invalid transitions' do
      project.state = 'draft'
      expect(project.may_submit_for_review?).to be_falsey
      expect(project.may_complete?).to be_falsey
      expect(project.may_reopen?).to be_falsey
    end
  end
end
