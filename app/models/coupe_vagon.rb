class CoupeVagon < Vagon
  validates :num_hi_places, :num_low_places, presence: true
end
