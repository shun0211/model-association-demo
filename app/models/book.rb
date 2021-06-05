class Book < ApplicationRecord
  belongs_to :publisher, optional: true
  has_one :category, dependent: :destroy
  validates :publisher, presence: true, if: :has_publisher?

  def has_publisher?
    publisher_id.present?
  end
end
