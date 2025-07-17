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

  describe 'ProjectLog logging' do
    let(:project) { create(:project, title: 'Test', manager_name: 'Manager') }

    it 'logs state changes' do
      expect {
        project.proceed!
      }.to change { project.project_logs.where(action: 'state_changed').count }.by(1)
      expect(project.project_logs.last.field).to eq('state')
      expect(project.project_logs.last.from_value).to eq('draft')
      expect(project.project_logs.last.to_value).to eq('proceeding')
    end

    it 'logs attribute changes' do
      project.update!(title: 'New Title')
      log = project.project_logs.where(action: 'attribute_changed', field: 'title').last
      expect(log.from_value).to eq('Test')
      expect(log.to_value).to eq('New Title')
    end
  end
end
