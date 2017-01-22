#вилидация ошибок .на не пустое значение presence
class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :title, :summary, :body, presence: true
end
