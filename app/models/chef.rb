class Chef < ActiveRecord::Base
  has_secure_password
  has_many :reservations
  has_many :messages
  after_initialize :init
  validates :first_name, :last_name,:address,:city,:state,:zip,presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, uniqueness: true
  validates_format_of :phone, :with => /\A(1?(?: |\-|\.)?(?:\(\d{3}\)|\d{3})(?: |\-|\.)?\d{3}(?: |\-|\.)?\d{4})\z/, message: "bad format ex. 555-555-5555"
  # validates :password, confirmation: true, length: {minimum: 6}
  # validates :password_confirmation, presence: true

  def init
    self.active = false if (self.has_attribute? :active) && self.active.nil?
  end
end
