class Portfolio < ApplicationRecord
  validates_presence_of :title, :subtitle, :body, :main_image, :thumb_image

  def self.React
    where(subtitle: 'React')
  end
end
