class UserSerializer
  include FastJsonapi::ObjectSerializer
  attribute :created_date do |user|
    user
  end
end
