class Link < ApplicationRecord
  validates_presence_of :lookup_code, :url
  validates_uniqueness_of :lookup_code
end
