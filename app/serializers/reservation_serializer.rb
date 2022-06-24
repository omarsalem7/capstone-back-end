class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :city, :date, :user_id, :course_id

  has_one :user
end
