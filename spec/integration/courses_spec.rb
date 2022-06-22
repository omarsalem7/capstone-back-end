# rubocop:disable Metrics/BlockLength
require 'swagger_helper'

RSpec.describe 'v1/courses', type: :request do
  include RequestSpecHelper

  let(:access_token) { confirm_and_login_user }
  let(:Authorization) { "Bearer #{access_token}" }

  describe 'coursesAPI' do
    before(:all) do
      FactoryBot.create(:course)
      FactoryBot.create(:course)
    end

    path '/v1/courses/{id}' do
      get 'Retrieves a course' do
        tags 'Courses'
        produces 'application/json', 'application/xml'
        security [Bearer: {}]
        parameter name: :Authorization, in: :header, type: :string
        parameter name: :id, in: :path, type: :string

        response '200', 'name found' do
          schema type: :object,
                 properties: {
                   id: { type: :integer },
                   name: { type: :string },
                   description: { type: :string },
                   location: { type: :string },
                   size: { type: :string },
                   price: { type: :string },
                   image: { type: :string },
                 },
                 required: %w[id name description location size price image]

          let(:id) do
            Course.create(name: 'Course 2', description: 'Good Course', location: 'Africa', size: '20 by 40',
              price: '100', image: 'photo.png').id
          end
          run_test!
        end

        response '404', 'Course not found' do
          let(:id) { 'invalid' }
          run_test!
        end
      end
    end

    path '/v1/courses/{id}' do
      parameter name: 'id', in: :path, type: :string, description: 'id'

      delete 'delete course' do
        tags 'Courses'
        produces 'application/json'
        security [Bearer: {}]
        parameter name: :Authorization, in: :header, type: :string
        parameter name: :id, in: :path, type: :string

        response '200', 'Course deleted successfully' do
          schema type: :object,
                 properties: {
                   message: { type: :string }
                 },
                 required: %w[message]

                 let(:id) do
                  Course.create(name: 'Course 2', description: 'Good Course', location: 'Africa', size: '20 by 40',
                    price: '100', image: 'photo.png').id
                end
          run_test!
        end

        response '404', 'No courses found' do
          schema type: :object,
                 properties: {
                   error: { type: :string },
                   error_message: { type: :array }
                 }

          let(:id) { 'invalid' }
          run_test!
        end
      end
    end

    path '/v1/courses' do
      post 'Creates a course' do
        tags 'courses'
        consumes 'application/json', 'application/xml'
        security [Bearer: {}]
        parameter name: :Authorization, in: :header, type: :string
        parameter name: :course, in: :body, schema: {
          type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            description: { type: :string },
            location: { type: :string },
            size: { type: :string },
            price: { type: :string },
            image: { type: :string },
          },
          required: %w[id name description location size price image]
        }

        response '201', 'course created' do
          let(:course) do
            { name: 'Course 2', description: 'Good Course', location: 'Africa', size: '20 by 40', price: '100', image: 'photo.png' }
          end
          schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            description: { type: :string },
            location: { type: :string },
            size: { type: :string },
            price: { type: :string },
            image: { type: :string },
          }
          run_test!
        end

        response '422', 'invalid request' do
          let(:course) { { name: 'foo' } }
          run_test!
        end
      end

      get 'Get all courses' do
        tags 'Courses'
        consumes 'application/json', 'application/xml'
        security [Bearer: {}]
        parameter name: :Authorization, in: :header, type: :string

        response '200', 'All courses fetched' do
          schema type: :object,
                 properties: {
                   message: { type: :array,
                              items: { type: :string } },
                   data: { type: :array,
                           items: { type: :object,
                           properties: {
                            id: { type: :integer },
                            name: { type: :string },
                            description: { type: :string },
                            location: { type: :string },
                            size: { type: :string },
                            price: { type: :string },
                            image: { type: :string },
                          } } }

                 }
          run_test! do |response|
            json = JSON.parse(response.body)
            expect(json['data'].length).to be >= 2
            expect(json['message']).to eq(['All courses loaded'])
          end
        end

        response '404', 'No courses found' do
          schema type: :object,
                 properties: {
                   error: { type: :string },
                   error_message: { type: :array,
                                    items: { type: :string } }
                 }
        end
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
