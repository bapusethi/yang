# frozen_string_literal: true

class Picture < ApplicationRecord
  belongs_to :pet

  has_attached_file :image, styles: { thumb: '100x100>' }
  validates_attachment_content_type :image, content_type: %r{\Aimage/.*\z}
end
