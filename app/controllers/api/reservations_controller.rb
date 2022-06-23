class Api::ReservationsController < ApplicationController
  # before_action :authenticate_user
  def index
    reservations = Reservation.where(user_id: current_user.id)
    render json: reservations, status: 200
  end

  def create
    reservation = Reservation.new(reservation_params)
    if reservation.save
      render json: reservation, status: 200
    else
      render json: { errors: 'Reservations were not created' }, status: :unprocessible_entity
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date, :city, :course_id, :user_id)
  end
end
