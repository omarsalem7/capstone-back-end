require 'rails_helper'

RSpec.describe Course, type: :model do
  subject do
    described_class.new(name: 'Test Course', description: 'Best Course', location: 'Africa City',
                        price: '120', size: '20 by 40', image: 'photo.png')
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a name' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a name' do
    subject.location = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without price' do
    subject.price = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without price' do
    subject.size = nil
    expect(subject).to_not be_valid
  end

  it 'is valid without an image' do
    subject.image = nil
    expect(subject).to be_valid
  end
end
