require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'AASM state machine' do
    let(:project) { build :project, title: 'Test', manager_name: 'Manager' }

    it 'has initial state draft' do
      expect(project.aasm.current_state).to eq(:draft)
    end

    it 'transitions from draft to proceeding with #proceed!' do
      project.save!
      project.proceed!
      expect(project.aasm.current_state).to eq(:proceeding)
    end

    it 'transitions from proceeding to done with #complete!' do
      project.save!
      project.proceed!
      project.complete!
      expect(project.aasm.current_state).to eq(:done)
    end

    it 'transitions from done to draft with #restart!' do
      project.save!
      project.proceed!
      project.complete!
      project.restart!
      expect(project.aasm.current_state).to eq(:proceeding)
    end

    it 'does not allow invalid transitions' do
      project.save!
      expect(project.may_complete?).to be_falsey
      expect(project.may_restart?).to be_falsey
      project.proceed!
      expect(project.may_proceed?).to be_falsey
      project.complete!
      expect(project.may_complete?).to be_falsey
    end
  end
end
