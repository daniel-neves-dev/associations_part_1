class Author < ApplicationRecord
  has_many :books, dependent: :destroy
  has_one :account

  has_one_attached :avatar

  validates :name, presence: true
  def avatar_resize
    return unless avatar.content_type.in?(%w[image/jpeg image/png image/psd image/bmp])

    avatar.variant(resize_to_limit: [100,100])
  end
end
