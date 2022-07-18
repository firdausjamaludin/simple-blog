class Post < ApplicationRecord
  belongs_to :author

  has_one_attached :header_image
end
