require 'rails_helper'

RSpec.describe Entity, type: :model do
  subject do
    @user = User.new(name: 'Himas', email: 'him@mail.com', password: '123456')
    @group = @user.groups.new(user_id: @user.id, name: 'Food', icon: 'https://images.unsplash.com/photo-1553846830-8fb467fe2453?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=874&q=80')
    @entity = Entity.new(name: 'Burger', amount: 10, user_id: @user.id, group: @group)
  end
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'amount should be present' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'Should be associated to a group' do
    expect(subject).to respond_to(:group)
  end
end
