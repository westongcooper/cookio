class Message < ActiveRecord::Base
  belongs_to :chef
  belongs_to :user
  belongs_to :reservation
  validates :message, presence: true
end
