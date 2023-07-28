class Book < ApplicationRecord
  belongs_to :author

  validates :title, :publish_at, presence: true

  has_one_attached :image

  def image_resize
    return unless image.content_type.in?(%w[image/jpeg image/png image/psd image/bmp])
    image.variant(resize_to_limit:[300,300]).processed
  end
end
