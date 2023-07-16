class Book < ApplicationRecord
  belongs_to :author

  validates :title, :publish_at, presence: true 
end
