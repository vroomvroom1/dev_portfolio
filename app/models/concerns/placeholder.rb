module Placeholder
  extend ActiveSupport::Concern


#Allows module to contain image rather than link
  def self.image_generator(height:, width:)
    "http://via.placeholder.com/#{height}x#{width}"
  end
end
