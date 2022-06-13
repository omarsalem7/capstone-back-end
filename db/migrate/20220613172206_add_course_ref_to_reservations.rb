class AddCourseRefToReservations < ActiveRecord::Migration[7.0]
  def change
    add_reference :reservations, :course, null: false, foreign_key: true
  end
end
