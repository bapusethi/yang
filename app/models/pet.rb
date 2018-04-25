class Pet < ApplicationRecord
  belongs_to :contact
  has_many :pictures
  enum gender: [:male,:female]
end
