require 'elasticsearch/model'
class Product < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_attachment_presence :image
  belongs_to :category
  has_many :line_items, dependent: :destroy
  belongs_to :user, optional: true
  # before_destroy :not_referenced_by_any_line_item

  private

  # def not_refereced_by_any_line_item
  #   unless line_items.empty?
  #     errors.add(:base, "Line items present")
  #     throw :abort
  #   end
  # end
end
Product.import(force: true)
