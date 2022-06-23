require 'rails_helper'

RSpec.describe 'Reservations', type: :request do
  reservation1 = Reservation.new(date: '24-06-2022', city: 'Test City')

  describe 'GET /index' do
    before(:example) { get '/api/reservations' }

    it 'should returns http 200 success' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /show' do
    before(:example) { get "/api/reservations/#{reservation.id}" }

    it 'should returns http 200 success' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'Post /create' do
    before(:example) do
      post '/api/reservations', params: { reservation: { date: '24-06-2022', city: 'Test City' } }
    end

    it 'should returns http 201 created' do
      expect(response).to have_http_status(201)
    end
  end
end
