class Contact < ApplicationRecord
	geocoded_by :full_street_address   # can also be an IP address
	after_validation :geocode          # auto-fetch coordinates

	def full_street_address
		"#{unit} #{street_number} #{street_name} #{suburb} #{post_code}"
	end
end
