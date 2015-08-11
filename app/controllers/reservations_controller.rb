class ReservationsController < ApplicationController
  before_action :set_user, only: [:new, :create]
  before_action :require_logged_in
  before_action :require_chef, only: [:index,:update]
  before_action :belongs_to_or_nil_or_admin, only: :show
  before_action :belongs_to_user_or_admin, only: [:destroy]

  include ApplicationHelper
  def index
    # @chef_reservations = Reservation.chef(current_chef)
    # @chef_old_reservations = Reservation.chef_old(current_chef)
    @reservations = Reservation.available
    @chef = Chef.find(session[:chef_id])
    @num_rows = (@reservations.count - 1)
    @i = 0
    # byebug
  end

  def new
    @reservation = Reservation.new_preset(@user,params[:recipe])
    @recipes = Recipe.all
  end

  def show
    @reservation = Reservation.find(params[:id])
    @messages = Message.where(reservation_id: params[:id]).includes(:user, :chef)
    @user = @reservation.user
    @chef = @reservation.chef
    @new_message = Message.new
  end

  def create
    @reservation = current_user.reservations.new reservation_params.except(:stripeToken, :amount)
    if @reservation.save
      # ReservationMailer.new_reservation(@reservation).deliver_now

      customer = Stripe::Customer.create(
        :email => reservation_params[:stripeEmail],
        :card  => reservation_params[:stripeToken]
      )

      Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => reservation_params[:amount],
        :description => 'Rails Stripe customer',
        :currency    => 'usd'
      )
      respond_to do |format|  ## Add this
        format.json { render json: @reservation, status: :ok}
        ## Other format
      end              else
      redirect_to :back, flash:{notice:' You were not charged please make sure required fields are filled'}
    end
  end
  def update

    reservation = Reservation.find(params.require(:id))
    @reservation = reservation
    if reservation.update(chef_id:current_chef.id)
      ReservationMailer.reservation_reserved(@reservation).deliver_now
      redirect_to @reservation, flash:{notice:"Reservation Confirmed"}
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.canceled = true
    @reservation.save
    ReservationMailer.reservation_canceled(@reservation).deliver_now
    redirect_to root_path, flash:{notice:"Reservation Removed"}
  end

  private
  def reservation_params
    params.
        require(:reservation).
        permit(:details, :date, :stripeEmail, :stripeToken, :plates, :amount, :time, :address, :address2, :city, :state, :zip, :phone, :recipe_id, :plates)
  end
  def set_user
    @user = current_user
  end
end
