class BookingMailer < ApplicationMailer
  default from: 'odin-flight-booker@localhost'

  def thanks_for_booking
    @user = params[:user]

    mail(to: @user.email, subject: "Thanks for booking with Odin Airways!")
  end
end
