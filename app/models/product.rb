class Product < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_attachment_presence :image
end
