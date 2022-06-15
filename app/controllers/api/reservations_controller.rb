class Api::ReservationsController < ApplicationController
   def index 
    reservations = Reservation.all
    render json: reservations
    # change this line of code
   end
end

