#вилидация ошибок .на не пустое значение presence
class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
 validates :title, :summary, :body, presence: true
  #validates :title, length: {minimum: 2, maximum: 12}
  #validates :summary, length: {minimum: 2, maximum: 22}
  #validates :body, length: {minimum: 3}
end
