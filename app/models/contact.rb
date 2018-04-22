class Contact < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  geocoded_by :full_street_address
  after_validation :geocode
  has_many :pets
  acts_as_messageable

  def full_street_address
    "#{unit} #{street_number} #{street_name} #{suburb} #{post_code}"
  end

  def name
    "#{first_name} #{last_name}"
  end

  def mailboxer_email(object)
    nil
  end
end
