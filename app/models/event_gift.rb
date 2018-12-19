class EventGift < ApplicationRecord
  has_many :participants, class_name: 'User'
  accepts_nested_attributes_for :participants, reject_if: :all_blank, allow_destroy: true
  validates_presence_of :title, :price
  validate :participants_number

  def participants_number
    errors.add(:participants, 'must be more than or equal to three') if self.participants.size < 3
  end

end
