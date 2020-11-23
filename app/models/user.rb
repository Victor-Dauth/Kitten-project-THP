class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  # after_create :welcome_send

=begin

  validates :first_name,
    presence: true,
    length: { in: 2..20 }
  validates :last_name,
    presence: true,
    length: { in: 2..20 }
    
  has_one_attached :avatar

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

=end

end
