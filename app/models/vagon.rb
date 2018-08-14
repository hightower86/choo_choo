class Vagon < ApplicationRecord
  belongs_to :train
  validates :number, presence: true
  V_TYPES = [SeatVagon, EconomyVagon, CoupeVagon, ComfortVagon]

  scope :economy, -> { where(type: 'EconomyVagon') }
  scope :coupe,   -> { where(type: 'CoupeVagon') }
  scope :comfort, -> { where(type: 'ComforyVagon') }
  scope :seat,    -> { where(type: 'SeatVagon') }

  before_validation :set_number

  private

  def set_number
    self.number ||= train.vagons.maximum("number").to_i + 1 if train.present?
  end
end
