module RequestSpecHelper
  def json
    JSON.parse(response.body)
  end

  def confirm_and_login_user(user_role = 'admin')
    user = User.create(name: 'test', email: 'email@gmail.com', password: '123456', role: user_role)
    course = Course.create(name: 'Test Course', description: 'Best Course', location: 'Test City',
                           size: '20 by 40', price: '100', image: 'photo.png')
    Reservation.create(date: '2000-09-07', city: 'Test City', course_id: course.id, user_id: user.id)
    post '/login', params: { email: user.email, password: user.password }
    json['token']
  end

  def test_for_no_courses
    user = FactoryBot.create(:user)
    post '/login', params: { email: user.email, password: user.password }
    json['token']
  end

  def login_and_delete_user(user_role = 'admin')
    user = User.create(name: 'test', email: 'email@gmail.com', password: '123456', role: user_role)
    post '/login', params: { email: user.email, password: user.password }
    user.destroy
    json['token']
  end

  def login_and_create_reservation()
    user = User.create(name: 'test2', email: 'emailtest2@gmail.com', password: '123456')
    post '/login', params: { email: user.email, password: user.password }
    course = Course.create(name: 'Test Course', description: 'Best Course', location: 'Test City',
                           size: '20 by 40', price: '100', image: 'photo.png')
    reservation = Reservation.create(date: '2000-09-07', city: 'Test City', course_id: course.id, user_id: user.id)

    { token: json['token'], id: reservation.id }
  end

  def login_without_reservation()
    User.create(name: 'test', email: 'emailtest2@gmail.com', password: '123456')
    post '/login', params: { email: user.email, password: user.password }

    json['token']
  end
end
