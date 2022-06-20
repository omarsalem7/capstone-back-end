class UserSerializer
  include FastJsonapi::ObjectSerializer
  attribute :created_date do |user|
    user&.created_at&.strftime('%d/%m/%Y')
  end
end
