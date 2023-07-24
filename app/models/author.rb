class Author < ApplicationRecord
  has_many :books, dependent: :destroy
  has_one :account

  validates :name, presence: true
end
