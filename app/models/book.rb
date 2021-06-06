class Book < ApplicationRecord
  belongs_to :publisher, optional: true
  has_one :category, dependent: :destroy
  validates :publisher, presence: true, if: :has_publisher?
  # validates :publisher, presence: true, if: -> { publisher_id.present? }

  def has_publisher?
    publisher_id.present?
  end

  scope :published, -> { where(publisher_flag: true) }
  scope :published, lambda { where(publisher_flag: true) }
  scope :published, Proc.new { where(publisher_flag: true) }
  scope :published, proc { where(publisher_flag: true) }
end
