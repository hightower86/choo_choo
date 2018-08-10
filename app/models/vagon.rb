class Vagon < ApplicationRecord
  belongs_to :train
  validates :number, presence: true
  V_TYPES = ['плацкартный', 'купейный']

  before_validation :set_number

  private

  def set_number
    self.number ||= train.vagons.maximum("number").to_i + 1 if train.present?
  end
end
