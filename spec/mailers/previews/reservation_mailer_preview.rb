# Preview all emails at http://localhost:3000/rails/mailers/reservation_mailer
class ReservationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/reservation_mailer/NewReservation
  def NewReservation
    ReservationMailer.NewReservation
  end

  # Preview this email at http://localhost:3000/rails/mailers/reservation_mailer/ReservationReserved
  def ReservationReserved
    ReservationMailer.ReservationReserved
  end

  # Preview this email at http://localhost:3000/rails/mailers/reservation_mailer/ReservationCanceled
  def ReservationCanceled
    ReservationMailer.ReservationCanceled
  end

end
