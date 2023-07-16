class Book < ApplicationRecord
  belongs_to :author, dependent: :destroy

  validates :title, :publish_at
end
