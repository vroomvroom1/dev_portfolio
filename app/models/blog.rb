# Updates ID for routes

class Blog < ApplicationRecord
#enums monitor status of db record
  enum status: { draft: 0, published: 1 }
  extend FriendlyId
  friendly_id :title, use: :slugged
end
