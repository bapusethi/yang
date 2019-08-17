# frozen_string_literal: true

class Pet < ApplicationRecord
  belongs_to :contact
  has_many :pictures
  enum gender: %i[male female]

  def age
    "#{years} years #{months} months" if years && months
  end
end
