require 'rails_helper'

RSpec.describe Reservation, type: :model do

  describe 'validations' do
    let(:user) { User.create(name: 'Ally', email: 'test@test.com', password: '123456') }
    let(:course) do
      Course.create(name: 'Test Course', description: 'Best Course', location: 'Africa City',
                    price: '120', size: '20 by 40', image: 'photo.png')
    end
    subject { described_class.new(date: '2000-10-10', city: 'Africa City', user: user, course: course) }

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'that appointment belongs to user and course' do
      subject.save
      expect(user.reservations).to eq([subject])
      expect(course.reservations).to eq([subject])
      subject.destroy
    end

    it 'is not valid without a date' do
      subject.date = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a city' do
      subject.city = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a course_id' do
      subject.course_id = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a user_id' do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a user' do
      subject.user = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a course' do
      subject.course = nil
      expect(subject).to_not be_valid
    end
  end
end
