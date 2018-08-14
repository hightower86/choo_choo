class Vagon < ApplicationRecord
  belongs_to :train
  validates :number, presence: true
  V_TYPES = { SeatVagon: "сидячий", EconomyVagon: "плацкартный", CoupeVagon: "купе", ComfortVagon: "СВ" }

  scope :economy, -> { where(type: 'EconomyVagon') }
  scope :coupe,   -> { where(type: 'CoupeVagon') }
  scope :comfort, -> { where(type: 'ComfortVagon') }
  scope :seat,    -> { where(type: 'SeatVagon') }

  before_validation :set_number

  def get_v_type
    v_type = V_TYPES[type.to_sym]
  end

  private

  def set_number
    self.number ||= train.vagons.maximum("number").to_i + 1 if train.present?
  end


end
