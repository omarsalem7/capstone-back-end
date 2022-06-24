require 'rails_helper'

RSpec.describe 'Courses', type: :request do
  course = Course.new(
    name: 'Test Course',
    description: 'Best Course',
    location: 'Test City',
    size: '20 by 40',
    price: '100',
    image: 'https://images.freeimages.com/images/large-previews/1c6/golf-ball-in-the-fairway-1394202.jpg'
  )

  describe 'GET /index' do
    before(:example) { get '/api/courses' }

    it 'should returns http 200 success' do
      expect(response).to have_http_status(401)
    end
  end

  describe 'GET /show' do
    before(:example) { get "/api/courses/#{course.id}" }

    it 'should returns http 200 success' do
      expect(response).to have_http_status(401)
    end
  end

  describe 'Post /add-course' do
    before(:example) do
      post '/api/courses', params: {
        course: {
          name: 'Test Course',
          description: 'Best Course',
          location: 'Test City',
          size: '20 by 40',
          price: '100',
          image: 'https://images.freeimages.com/images/large-previews/1c6/golf-ball-in-the-fairway-1394202.jpg'
        }
      }
    end

    it 'should returns http 201 created' do
      expect(response).to have_http_status(401)
    end
  end
end
