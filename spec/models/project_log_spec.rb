require 'rails_helper'

RSpec.describe ProjectLog, type: :model do
  let(:project) { create(:project) }

  it 'is valid with valid attributes' do
    log = ProjectLog.new(project: project, action: 'state_changed')
    expect(log).to be_valid
  end

  it 'is invalid without a project' do
    log = ProjectLog.new(action: 'state_changed')
    expect(log).not_to be_valid
    expect(log.errors[:project]).to be_present
  end

  it 'is invalid without an action' do
    log = ProjectLog.new(project: project)
    expect(log).not_to be_valid
    expect(log.errors[:action]).to be_present
  end
end 