# frozen_string_literal: true

class Link < ApplicationRecord
  validates_format_of :url,
                      with: %r{\A(http|https)://[a-z0-9]+([\-.]{1}[a-z0-9]+)*\.[a-z]{2,63}(:[0-9]{1,5})?(/.*)?\z}ix
  validates :short, presence: true
  validates :url, presence: true
end
