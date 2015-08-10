require "rails_helper"

RSpec.describe ReservationMailer, type: :mailer do
  describe "NewReservation" do
    let(:mail) { ReservationMailer.NewReservation }

    it "renders the headers" do
      expect(mail.subject).to eq("Newreservation")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "ReservationReserved" do
    let(:mail) { ReservationMailer.ReservationReserved }

    it "renders the headers" do
      expect(mail.subject).to eq("Reservationreserved")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "ReservationCanceled" do
    let(:mail) { ReservationMailer.ReservationCanceled }

    it "renders the headers" do
      expect(mail.subject).to eq("Reservationcanceled")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
