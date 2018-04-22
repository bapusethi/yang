class Pet < ApplicationRecord
	belongs_to :contact
	enum gender: [:male,:female]
end
