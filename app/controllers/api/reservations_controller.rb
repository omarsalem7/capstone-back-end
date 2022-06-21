class Api::ReservationsController < ApplicationController
  def index
    reservations = Reservation.all
    render json: reservations
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
