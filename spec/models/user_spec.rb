require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(email: 'test@test.com', password: 'helloWORLD', name: 'test', role: 'admin') }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without an email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a password' do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a password less than 6 characters' do
    subject.password = 'a' * 4
    expect(subject).to_not be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is valid without a role (default role = user)' do
    subject.role = nil
    expect(subject).to be_valid
  end
end
