class ReservationMailer < ApplicationMailer
  layout 'mailer'
  default from: 'ben@cookio.co'

  def new_reservation(reservation)
    @user = reservation.user
    @this = reservation
    @url  = 'localhost:3000'
    mail(to: @user.email,     subject: 'You just created a reservation')
  end


  def reservation_reserved(reservation)
    @this = reservation
    @user = reservation.user
    @chef = reservation.chef
    @url  = 'localhost:3000'
    emails = [@user.email, @chef.email]
    mail(to: emails, subject: 'Your reservation has been confirmed')

  end


  def reservation_canceled(reservation)
    @this = reservation
    @user = reservation.user
    @chef = reservation.chef
    @url  = 'localhost:3000'
    emails = [@user.email, @chef.email]
    mail(to: emails, subject: 'Your reservation has been canceled')

  end
end
