class Vagon < ApplicationRecord
  belongs_to :train 

  validates :number, presence: true, uniqueness: { scope: :train_id }

  V_TYPES = { SeatVagon: "сидячий", EconomyVagon: "плацкартный", CoupeVagon: "купейный", ComfortVagon: "СВ" }

  scope :economy, -> { where(type: 'EconomyVagon') }
  scope :coupe,   -> { where(type: 'CoupeVagon') }
  scope :comfort, -> { where(type: 'ComfortVagon') }
  scope :seat,    -> { where(type: 'SeatVagon') }

  scope :head, -> { order(:number) } # сортировка с головы состава
  scope :tail, -> { order(:number).reverse_order } # сортировка с хвоста состава


  before_validation :set_number

  def get_v_type
    V_TYPES[type.to_sym]
  end

  private

  def set_number
    self.number |= train.vagons.maximum("number").to_i + 1
  end


end
