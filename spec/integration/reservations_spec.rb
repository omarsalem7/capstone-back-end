# rubocop:disable Metrics/BlockLength
require 'swagger_helper'

RSpec.describe 'v1/reservations', type: :request do
  include RequestSpecHelper

  let(:Authorization) { "Bearer #{confirm_and_login_user}" }
  let(:parameter_request) { login_and_create_reservation }
  let(:user) { FactoryBot.create(:user) }
  let(:course) do
    Course.create(name: 'Course 2', description: 'Good Course', location: 'Africa', size: '20 by 40',
    price: '100', image: 'photo.png').id
  end

  path '/reservations' do
    get('list reservations') do
      tags 'Reservations'
      consumes 'application/json'
      parameter name: :Authorization, in: :header, type: :string
      response(200, 'Get all reservations for a user') do
        schema type: :object,
               properties: {
                 message: { type: :array,
                            items: {
                              type: :string

                            } },
                 data: { type: :array,
                         items: { type: :object,
                                  properties: {
                                    user_id: { type: :integer },
                                    date: { type: :string },
                                    course_id: { type: :integer },
                                    course: { type: :object,
                                              properties: {
                                                id: { type: :integer },
                                                name: { type: :string },
                                                description: { type: :string },
                                                location: { type: :string },
                                                size: { type: :string },
                                                price: { type: :string },
                                                image: { type: :string },
                                              } }
                                  } } }
               }

        run_test!
      end

      response(404, 'No reservation') do
        schema type: :object,
               properties: {
                 message: { type: :array,
                            items: {
                              type: :string

                            } },
                 error: { type: :string }
               }

        let(:Authorization) { login_without_reservation }

        run_test!
      end
    end

    post('create reservation') do
      tags 'Reservations'
      consumes 'application/json'
      security [Bearer: {}]
      parameter name: :Authorization, in: :header, type: :string
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          date: { type: :string },
          city: { type: :string },
          course_id: { type: :string }
        },
        require: %w[course_id date city]
      }

      response(201, 'Reservation created') do
        let(:params) { { date: '2000/09/07', city: 'Africa City', course_id: course.id } }
        schema type: :object,
               properties: {
                 message: { type: :string },
                 data: { type: :object,
                         properties: {
                           course_id: { type: :integer },
                           date: { type: :string },
                           city: { type: :string }
                         } }
               }

        run_test!
      end

      response '403', 'Reservation not created' do
        let(:params) { { date_of_appointment: '2000/99/97', doctor_id: -1 } }
        schema type: :object,
               properties: {
                 error: { type: :string },
                 error_message: { type: :object,
                                  properties: {
                                    course: { type: :array },
                                    date: { type: :array },
                                    city: { type: :array }
                                  } }

               }

        run_test!
      end
    end
  end

  path '/reservations/{id}' do
    delete('delete reservations') do
      tags 'Reservations'
      consumes 'application/json'
      parameter name: :Authorization, in: :header, type: :string
      parameter name: :id, in: :path, type: :string

      response(200, 'successful') do
        let(:id) { parameter_request[:id] }
        let(:Authorization) { "Bearer #{parameter_request[:token]}" }

        schema type: :object,
               properties: {
                 message: { type: :array,
                            items: { type: :string } },
                 data: { type: :object,
                         properties: {
                           doctor_id: { type: :integer },
                           date: { type: :string },
                           city: { type: :string },
                           user_id: { type: :integer }

                         } }
               }

        run_test!
      end

      response(404, 'not found') do
        let(:id) { parameter_request[:id] }

        schema type: :object,
               properties: {
                 error: { type: :string },
                 error_message: { type: :array,
                                  items: { type: :string } }

               }
        run_test!
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
